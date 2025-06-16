import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../../database/hive/shop_details/shop_details.dart';
import '../../../utils/constants/hive_box_strings.dart';

class ShopDetailNotifier extends StateNotifier<AsyncValue<ShopDetail?>> {
  ShopDetailNotifier() : super(const AsyncValue.loading()) {
    loadShopDetails();
  }
  final _boxName = VHive.shopDetailBox;
  final _keyName = VHive.shopDetailKey;

  Future<void> loadShopDetails() async {
    try {
      final box = await Hive.openBox<ShopDetail>(_boxName);
      final savedDetail = box.get(_keyName);
      state = AsyncValue.data(savedDetail);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateShopDetails(ShopDetail shopDetail) async {
    state = const AsyncValue.loading();
    try {
      final box = await Hive.openBox<ShopDetail>(_boxName);
      await box.put(_keyName, shopDetail);
      state = AsyncValue.data(shopDetail);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
