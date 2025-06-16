import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../utils/constants/hive_box_strings.dart';

class ColorIndexNotifier extends StateNotifier<int> {
  static const String key = VHive.selectedColorKey;
  final Box box = Hive.box(VHive.themeColorBox);

  ColorIndexNotifier() : super(_getInitialIndex());

  static int _getInitialIndex() {
    final box = Hive.box(VHive.themeColorBox);
    return box.get(key, defaultValue: 0) as int;
  }

  void setIndex(int idx) {
    state = idx;
    box.put(key, idx);
  }
}
