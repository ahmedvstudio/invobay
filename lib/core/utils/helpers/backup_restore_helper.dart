import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/utils/messages/logger.dart';
import '../../database/drift/app_database.dart';
import '../constants/text_strings.dart';
import '../messages/snackbar.dart';

class BackupRestoreHelper {
  static Future<List<File>> _collectFiles() async {
    final appDir = await getApplicationDocumentsDirectory();
    final allFiles = appDir.listSync().whereType<File>().toList();
    final List<File> collectedFiles = [];

    // Collect all .hive files
    final hiveFiles = allFiles.where((file) {
      final name = file.uri.pathSegments.last;
      return name.endsWith('.hive');
    }).toList();

    if (hiveFiles.isEmpty) {
      Vlogger.error("⛔ No Hive box files found (*.hive)");
    } else {
      for (var f in hiveFiles) {
        Vlogger.info("📦 Including: ${f.path}");
      }
      collectedFiles.addAll(hiveFiles);
    }

    // Add Drift DB file
    final dbFile = File('${appDir.path}/app.sqlite');
    if (await dbFile.exists()) {
      Vlogger.info("📦 Including: ${dbFile.path}");
      collectedFiles.add(dbFile);
    } else {
      Vlogger.error("⛔ MISSING Drift DB: app.sqlite");
    }

    return collectedFiles;
  }

  static Future<void> backupAll({
    required String encryptionKey,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final files = await _collectFiles();

    // Make ZIP archive
    final archive = Archive();
    for (var file in files) {
      final data = await file.readAsBytes();
      archive
          .addFile(ArchiveFile(file.uri.pathSegments.last, data.length, data));
    }
    final zipData = ZipEncoder().encode(archive);

    // Encrypt ZIP
    final key = encrypt.Key.fromUtf8(encryptionKey);
    final iv = encrypt.IV.fromSecureRandom(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encryptBytes(zipData, iv: iv);

    // Save encrypted backup (prepend IV)
    final backupFile = File('${tempDir.path}/${VText.backupFileName}');
    await backupFile.writeAsBytes([...iv.bytes, ...encrypted.bytes]);
    Vlogger.info(backupFile.path);
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(backupFile.path)],
        text: 'App Encrypted Backup',
      ),
    );
  }

  static Future<void> restoreAll({
    required BuildContext context,
    required String encryptionKey,
  }) async {
    // Pick file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      // allowedExtensions: ['enc'],
    );

    if (result == null) {
      VSnackbar.info(context: context, message: 'Restore cancelled.');
      return;
    }

    if (result.files.single.path == null) {
      VSnackbar.error(context: context, message: 'Failed to get file path.');
      return;
    }
    final backupPath = result.files.single.path!;
    final encryptedBackup = await File(backupPath).readAsBytes();

    // Extract IV and encrypted data
    final iv = encrypt.IV(encryptedBackup.sublist(0, 16));
    final encryptedData = encryptedBackup.sublist(16);

    // Decrypt ZIP
    final key = encrypt.Key.fromUtf8(encryptionKey);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    late Uint8List decryptedZipData;
    try {
      decryptedZipData = Uint8List.fromList(
        encrypter.decryptBytes(encrypt.Encrypted(encryptedData), iv: iv),
      );
    } catch (e) {
      throw Exception("Decryption failed. Wrong password or corrupted file.");
    }

    // Unzip and overwrite files
    final archive = ZipDecoder().decodeBytes(decryptedZipData);
    final appDir = await getApplicationDocumentsDirectory();

    for (final file in archive.files) {
      if (!file.isFile) continue;
      final outFile = File('${appDir.path}/${file.name}');
      await outFile.writeAsBytes(file.content as List<int>);
    }
  }

  ///----------------- use these
  static Future<void> backup(BuildContext context, String encryptionKey) async {
    try {
      VSnackbar.info(context: context, message: 'Creating backup...');
      await BackupRestoreHelper.backupAll(
        encryptionKey: encryptionKey,
      );
      if (!context.mounted) return;
      VSnackbar.success(context: context, message: 'Backup complete!');
    } catch (e) {
      VSnackbar.error(context: context, message: 'Backup failed: $e');
      Vlogger.error('Backup failed: $e');
    }
  }

  static Future<void> restore(
      BuildContext context, String encryptionKey) async {
    try {
      // CLOSE Hive & Drift connections here!
      await Hive.close();
      await AppDatabase.instance.close();
      if (!context.mounted) return;
      VSnackbar.info(context: context, message: 'Restoring...');

      await BackupRestoreHelper.restoreAll(
        context: context,
        encryptionKey: encryptionKey,
      );
      if (!context.mounted) return;
      VSnackbar.success(
          context: context,
          message: 'Restore complete! Please restart the app.');
    } catch (e) {
      VSnackbar.error(context: context, message: 'Restore failed: $e');
    }
  }

  static Future<void> deleteAllLocalData() async {
    await Hive.close();
    await AppDatabase.instance.close();

    final appDir = await getApplicationDocumentsDirectory();
    final allFiles = appDir.listSync().whereType<File>();

    // Delete all Hive box files (*.hive)
    for (var file in allFiles) {
      final name = file.uri.pathSegments.last;
      if (name.endsWith('.hive')) {
        // or use name.endsWith('.hive') for stricter match
        await file.delete();
        Vlogger.info("🗑 Deleted: ${file.path}");
      }
    }

    // Delete Drift DB file
    final dbFile = File('${appDir.path}/app.sqlite');
    if (await dbFile.exists()) {
      await dbFile.delete();
      Vlogger.info("🗑 Deleted Drift DB: ${dbFile.path}");
    }

    // Delete temp directory
    final tempDir = await getTemporaryDirectory();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
      Vlogger.info("🗑 Deleted temp backup directory");
    }
  }
}
