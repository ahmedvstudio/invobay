import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

class ColorIndexNotifier extends StateNotifier<int> {
  static const String key = 'selected_color_index';
  final Box box = Hive.box('theme_color');

  ColorIndexNotifier() : super(_getInitialIndex());

  static int _getInitialIndex() {
    final box = Hive.box('theme_color');
    return box.get(key, defaultValue: 0) as int;
  }

  void setIndex(int idx) {
    state = idx;
    box.put(key, idx);
  }
}
