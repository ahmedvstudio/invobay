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
import '../constants/lists.dart';
import '../constants/text_strings.dart';
import '../messages/snackbar.dart';

class BackupRestoreHelper {
  static Future<List<File>> _collectFiles() async {
    final appDir = await getApplicationDocumentsDirectory();
    List<File> files = [];

    // Drift DB
    final dbFile = File('${appDir.path}/app.sqlite');
    if (await dbFile.exists()) files.add(dbFile);

    // Hive Boxes
    for (var box in VLists.hiveBoxes) {
      Vlogger.info(box);
      final hiveFile = File('${appDir.path}/$box.hive');
      if (await hiveFile.exists()) files.add(hiveFile);
    }
    return files;
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
    required String encryptionKey,
  }) async {
    // Pick file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      // allowedExtensions: ['enc'],
    );
    if (result == null || result.files.single.path == null) return;

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
}
