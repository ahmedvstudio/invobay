import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/providers/db_providers/hive_providers/shop_detail_notifier.dart';

import '../../../database/hive/shop_details/shop_details.dart';

final shopDetailProvider =
    StateNotifierProvider<ShopDetailNotifier, AsyncValue<ShopDetail?>>(
  (ref) => ShopDetailNotifier(),
);
