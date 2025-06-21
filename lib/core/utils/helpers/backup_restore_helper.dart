import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/utils/messages/logger.dart';
import '../../database/drift/app_database.dart';
import '../constants/text_strings.dart';
import '../messages/snackbar.dart';

class BackupRestoreHelper {
  /// --> Collecting files for Backup
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

  /// --> Backup
  static Future<void> backupAll({
    required String encryptionKey,
    required BuildContext context,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final files = await _collectFiles();
    VSnackbar.info('Creating backup...');
    try {
      // Make ZIP archive
      final archive = Archive();
      for (var file in files) {
        final data = await file.readAsBytes();
        archive.addFile(
            ArchiveFile(file.uri.pathSegments.last, data.length, data));
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
      VSnackbar.success('Backup complete!');
    } catch (e) {
      VSnackbar.error('Backup failed: $e');
    }
  }

  /// ---> Restore
  static Future<void> restoreAll({
    required BuildContext context,
    required String encryptionKey,
  }) async {
    // Pick file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );
    if (result == null) {
      VSnackbar.info('Restore cancelled.');
      return;
    }
    final filePath = result.files.single.path;
    final fileName = result.files.single.name;

    if (filePath == null || !fileName.endsWith('.invobak')) {
      VSnackbar.error('Invalid backup file. Please select a .invobak file.');
      return;
    }

    await Hive.close();
    await AppDatabase.instance.close();
    VSnackbar.info('Restoring...');
    try {
      final encryptedBackup = await File(filePath).readAsBytes();

      // Extract IV and encrypted data
      final iv = encrypt.IV(encryptedBackup.sublist(0, 16));
      final encryptedData = encryptedBackup.sublist(16);

      // Decrypt ZIP
      if (encryptionKey.length != 32) {
        VSnackbar.error('Encryption key must be 32 characters for AES-256.');
        return;
      }
      final key = encrypt.Key.fromUtf8(encryptionKey);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      late Uint8List decryptedZipData;

      decryptedZipData = Uint8List.fromList(
        encrypter.decryptBytes(encrypt.Encrypted(encryptedData), iv: iv),
      );

      // Unzip and overwrite files
      final archive = ZipDecoder().decodeBytes(decryptedZipData);
      final appDir = await getApplicationDocumentsDirectory();

      for (final file in archive.files) {
        if (!file.isFile) continue;
        final outFile = File('${appDir.path}/${file.name}');
        await outFile.writeAsBytes(file.content as List<int>);
      }
      for (int i = 3; i >= 1; i--) {
        VSnackbar.success('Restore complete! Restarting in $i...');
        await Future.delayed(const Duration(seconds: 1));
      }
      await Restart.restartApp();
    } catch (e) {
      VSnackbar.error(
        'Restore failed: ${e.toString()}',
      );
    }
  }

  /// ---> Delete
  static Future<void> deleteAllLocalData(BuildContext context) async {
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
    for (int i = 3; i >= 1; i--) {
      VSnackbar.info('Restarting in $i...');
      await Future.delayed(const Duration(seconds: 1));
    }
    await Restart.restartApp();
  }
}
