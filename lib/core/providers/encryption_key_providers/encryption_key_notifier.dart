import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../utils/constants/env.dart';
import '../../utils/constants/hive_box_strings.dart';

const _boxName = VHive.encryptionBox;
const _keyName = VHive.encryptionKey;

class EncryptionKeyNotifier extends StateNotifier<String> {
  EncryptionKeyNotifier() : super(VEnv.backupEncryptionKey) {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final box = await Hive.openBox(_boxName);
    final savedKey = box.get(_keyName) as String?;
    if (savedKey != null && savedKey.length == 32) {
      state = savedKey;
    }
  }

  Future<void> updateKey(String newKey) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_keyName, newKey);
    state = newKey;
  }
}
