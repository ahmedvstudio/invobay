import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/db_providers/hive_providers/shop_detail_provider.dart';
import '../../../core/utils/constants/colors.dart';

class VShopName extends ConsumerWidget {
  const VShopName({
    super.key,
    this.textColor = VColors.white,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopDetailAsync = ref.watch(shopDetailProvider);
    return shopDetailAsync.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => const Text('Shop Name'),
      data: (shopDetail) {
        final shopName = shopDetail?.name ?? 'Your Shop';
        return Text(
          shopName,
          style:
              Theme.of(context).textTheme.displaySmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}
