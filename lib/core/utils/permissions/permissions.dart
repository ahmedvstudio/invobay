import 'package:flutter/foundation.dart';
import 'package:invobay/core/utils/messages/logger.dart';
import 'package:invobay/core/utils/messages/toast.dart';
import 'package:permission_handler/permission_handler.dart';

class VPermissions {
  VPermissions._();

  /// Request a single permission
  static Future<bool> request(Permission permission) async {
    final status = await permission.request();
    final granted = status.isGranted;

    if (granted) {
      Vlogger.info('${permission.toString()} granted');
    } else {
      Vlogger.warning('${permission.toString()} denied');
      VToast.warning(message: 'Denied');
    }

    return granted;
  }

  /// Request multiple permissions
  static Future<Map<Permission, bool>> requestMultiple(
      List<Permission> permissions) async {
    final results = await permissions.request();
    results.forEach((permission, status) {
      if (status.isGranted) {
        Vlogger.info('${permission.toString()} granted');
      } else {
        Vlogger.warning('${permission.toString()} denied');
      }
    });

    return results.map((p, s) => MapEntry(p, s.isGranted));
  }

  /// Platform-specific notification permission request
  static Future<void> requestNotificationPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await request(Permission.notification);
    }
  }

  // You can add specific permission helpers if needed
  static Future<bool> camera() => request(Permission.camera);
  static Future<bool> location() => request(Permission.location);
  static Future<bool> storage() => request(Permission.storage);
  static Future<bool> microphone() => request(Permission.microphone);
  static Future<bool> contacts() => request(Permission.contacts);
// Add more shorthand helpers as needed...
}

///Ex.
/// await VPermissions.camera();
/// await VPermissions.requestNotificationPermission();
/// await VPermissions.requestMultiple([
/// Permission.camera,
/// Permission.microphone,
/// ]);
