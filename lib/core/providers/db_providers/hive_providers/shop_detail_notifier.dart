import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';

import '../../../database/hive/shop_details/shop_details.dart';

class ShopDetailNotifier extends StateNotifier<AsyncValue<ShopDetail?>> {
  ShopDetailNotifier() : super(const AsyncValue.loading()) {
    loadShopDetails();
  }

  Future<void> loadShopDetails() async {
    try {
      final box = await Hive.openBox<ShopDetail>('shopDetailBox');
      final savedDetail = box.get('shop_info');
      state = AsyncValue.data(savedDetail);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateShopDetails(ShopDetail shopDetail) async {
    state = const AsyncValue.loading();
    try {
      final box = await Hive.openBox<ShopDetail>('shopDetailBox');
      await box.put('shop_info', shopDetail);
      state = AsyncValue.data(shopDetail);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
