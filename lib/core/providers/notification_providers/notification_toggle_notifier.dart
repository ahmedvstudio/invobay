import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../utils/constants/hive_box_strings.dart';

class NotificationToggleNotifier extends StateNotifier<Map<String, bool>> {
  final Box _box;

  NotificationToggleNotifier(this._box) : super(_loadInitialState(_box));

  static Map<String, bool> _loadInitialState(Box box) {
    final raw = box.get(VHive.togglesKey);
    if (raw == null) {
      return {
        'all': true,
        'low_stock': true,
        'out_of_stock': true,
        'sell_checkout': true,
        'buy_checkout': true,
        'return_checkout': true,
      };
    }
    return Map<String, bool>.from(raw as Map);
  }

  void toggleNotification(String key, bool value) {
    Map<String, bool> newState;
    if (key == 'all') {
      newState = Map<String, bool>.from(state);
      newState.updateAll((_, __) => value);
    } else {
      newState = {
        ...state,
        key: value,
        'all': value &&
            state.entries.where((e) => e.key != 'all').every((e) => e.value),
      };
    }
    state = newState;
    _box.put(VHive.togglesKey, newState);
  }
}
