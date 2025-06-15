import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'encryption_key_notifier.dart';

final encryptionKeyProvider =
    StateNotifierProvider<EncryptionKeyNotifier, String>(
  (ref) => EncryptionKeyNotifier(),
);
