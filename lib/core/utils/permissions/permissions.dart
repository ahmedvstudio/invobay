import 'package:permission_handler/permission_handler.dart';

class VPermissions {
  VPermissions._();

  // --> Calendar Permissions
  static Future<bool> calendar() async =>
      _request(Permission.calendarFullAccess);

  // --> Camera Permissions
  static Future<bool> camera() async => _request(Permission.camera);

  // --> Contacts Permissions
  static Future<bool> contacts() async => _request(Permission.contacts);

  // --> Location Permissions
  static Future<bool> location() async => _request(Permission.location);

  // --> Location Always Permissions
  static Future<bool> locationAlways() async =>
      _request(Permission.locationAlways);

  // --> Location When in Use Permissions
  static Future<bool> locationWhenInUse() async =>
      _request(Permission.locationWhenInUse);

  // --> Microphone Permissions
  static Future<bool> microphone() async => _request(Permission.microphone);

  // --> phone Permissions
  static Future<bool> phone() async => _request(Permission.phone);

  // --> photos Permissions
  static Future<bool> photos() async => _request(Permission.photos);

  // --> photos add only Permissions
  static Future<bool> photosAddOnly() async =>
      _request(Permission.photosAddOnly);

  // --> reminders Permissions
  static Future<bool> reminders() async => _request(Permission.reminders);

  // --> sensors Permissions
  static Future<bool> sensors() async => _request(Permission.sensors);

  // --> sms Permissions
  static Future<bool> sms() async => _request(Permission.sms);

  // --> speech Permissions
  static Future<bool> speech() async => _request(Permission.speech);

  // --> storage Permissions
  static Future<bool> storage() async => _request(Permission.storage);

  // --> ignoreBatteryOptimizations Permissions
  static Future<bool> ignoreBatteryOptimizations() async =>
      _request(Permission.ignoreBatteryOptimizations);

  // --> notifications Permissions
  static Future<bool> notifications() async =>
      _request(Permission.notification);

  // --> accessMediaLocation Permissions
  static Future<bool> accessMediaLocation() async =>
      _request(Permission.accessMediaLocation);

  // --> activityRecognition Permissions
  static Future<bool> activityRecognition() async =>
      _request(Permission.activityRecognition);

  // --> bluetooth Permissions
  static Future<bool> bluetooth() async => _request(Permission.bluetooth);

  // --> manageExternalStorage Permissions
  static Future<bool> manageExternalStorage() async =>
      _request(Permission.manageExternalStorage);

  // --> systemAlertWindow Permissions
  static Future<bool> systemAlertWindow() async =>
      _request(Permission.systemAlertWindow);

  // --> requestInstallPackages Permissions
  static Future<bool> requestInstallPackages() async =>
      _request(Permission.requestInstallPackages);

  // --> appTrackingTransparency Permissions
  static Future<bool> appTrackingTransparency() async =>
      _request(Permission.appTrackingTransparency);

  // --> criticalAlerts Permissions
  static Future<bool> criticalAlerts() async =>
      _request(Permission.criticalAlerts);

  // --> accessNotificationPolicy Permissions
  static Future<bool> accessNotificationPolicy() async =>
      _request(Permission.accessNotificationPolicy);

  // --> bluetoothScan Permissions
  static Future<bool> bluetoothScan() async =>
      _request(Permission.bluetoothScan);

  // --> bluetoothAdvertise Permissions
  static Future<bool> bluetoothAdvertise() async =>
      _request(Permission.bluetoothAdvertise);

  // --> bluetoothConnect Permissions
  static Future<bool> bluetoothConnect() async =>
      _request(Permission.bluetoothConnect);

  // --> nearbyWifiDevices Permissions
  static Future<bool> nearbyWifiDevices() async =>
      _request(Permission.nearbyWifiDevices);

  // --> Multiple Permissions
  static Future<Map<Permission, bool>> requestMultiple(
      List<Permission> permissions) async {
    final statuses = await permissions.request();
    return statuses
        .map((permission, status) => MapEntry(permission, status.isGranted));
  }

  // --> Private Helper
  static Future<bool> _request(Permission permission) async {
    var status = await permission.request();
    if (!status.isGranted) {
      status = await permission.request();
    }
    return status.isGranted;
  }
}

///--EXAMPLE
///final result = await VPermissions.requestMultiple([
///  Permission.camera,
///  Permission.microphone,
///  Permission.storage,
///  ]);
///  if (result[Permission.camera] == true &&
///  result[Permission.microphone] == true &&
///  result[Permission.storage] == true) {
///  All Permissions Granted
///  } else {
///  Handle Permissions Not Granted
///  }
