import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/localization_related_providers/localization_provider.dart';
import 'package:invobay/core/services/in_app_update/in_app_update_service.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

// Provider for the InAppUpdateService
final inAppUpdateProvider = Provider<InAppUpdateService>((ref) {
  return InAppUpdateService(ref);
});

// StreamProvider for the last checked string
final lastCheckedStringProvider = StreamProvider<String>((ref) async* {
  final loc = ref.watch(localizationProvider);
  final service = ref.read(inAppUpdateProvider);

  // Initial value
  final initialTime = await service.getLastChecked();
  if (initialTime == null) {
    yield loc.noUpdateCheckRecordedYet;
  } else {
    yield loc.lastChecked(
      VFormatters.formatVersionDate(DateTime.parse(initialTime)),
    );
  }

  // Listen to future updates
  await for (final time in service.lastCheckedStream) {
    if (time == null) {
      yield loc.noUpdateCheckRecordedYet;
    } else {
      yield loc.lastChecked(
        VFormatters.formatVersionDate(DateTime.parse(time)),
      );
    }
  }
});
