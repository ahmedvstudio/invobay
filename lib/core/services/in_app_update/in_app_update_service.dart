import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:invobay/core/utils/constants/hive_box_strings.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/messages/snackbar.dart';

class InAppUpdateService {
  final Ref ref;

  InAppUpdateService(this.ref);

  // Internal controller to emit updates
  final _lastCheckedController = StreamController<String?>.broadcast();

  // Method to notify listeners of a change
  void _notifyLastCheckedUpdated(String? newTime) {
    _lastCheckedController.add(newTime);
  }

  // Public method to get the stream of last checked timestamps
  Stream<String?> get lastCheckedStream => _lastCheckedController.stream;

  // Method to check for updates and save the last checked time
  Future<void> checkAndUpdate(
      {BuildContext? context, bool showUI = false}) async {
    try {
      final info = await InAppUpdate.checkForUpdate();

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        if (info.immediateUpdateAllowed) {
          await InAppUpdate.performImmediateUpdate();
        } else if (info.flexibleUpdateAllowed) {
          if (showUI && context != null) {
            if (!context.mounted) return;
            VSnackbar.info(context.loc.downloadingUpdate);
          }

          await InAppUpdate.startFlexibleUpdate();
          await InAppUpdate.completeFlexibleUpdate();

          if (context != null) {
            if (!context.mounted) return;
            VSnackbar.success(context.loc.updateDownloadedPleaseRestartTheApp);
          }
        }

        // ✅ Save last successful update check time
        final box = await Hive.openBox(VHive.settingsBox);
        final lastCheckedTime = DateTime.now().toIso8601String();
        await box.put(VHive.lastUpdateCheckKey, lastCheckedTime);

        // Notify listeners about the new last checked time
        _notifyLastCheckedUpdated(lastCheckedTime);
      } else {
        if (showUI && context != null) {
          if (!context.mounted) return;
          VSnackbar.success(context.loc.appIsAlreadyUpToDate);
        }
      }
    } catch (e) {
      debugPrint("⚠️ In-App Update Error: $e");

      if (e is PlatformException &&
          e.code == 'TASK_FAILURE' &&
          e.message?.contains('ERROR_APP_NOT_OWNED') == true) {
        debugPrint('⚠️ App not installed from Play Store.');
      }

      if (context != null && showUI) {
        if (!context.mounted) return;
        VSnackbar.error(context.loc.couldNotCheckForUpdate);
      }
    }
  }

  // Method to get the last checked timestamp
  Future<String?> getLastChecked() async {
    final box = await Hive.openBox(VHive.settingsBox);
    return box.get(VHive.lastUpdateCheckKey);
  }

  // Dispose the stream controller when no longer needed
  void dispose() {
    _lastCheckedController.close();
  }
}
