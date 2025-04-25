import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';
import 'navigator_key_provider.dart';

final localizationProvider = Provider<S>((ref) {
  final context = ref.watch(navigatorKeyProvider).currentContext;
  return context != null ? S.of(context) : S.current;
});
