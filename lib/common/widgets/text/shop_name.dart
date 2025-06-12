import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../core/providers/db_providers/hive_providers/shop_detail_provider.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

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
        final shopPhone1 = shopDetail?.phone ?? '';
        final shopPhone2 = shopDetail?.extraPhone ?? '';
        final shopDescription = shopDetail?.description ?? '';
        final address = [
          shopDetail?.country,
          shopDetail?.state,
          shopDetail?.city,
          shopDetail?.street,
        ];

        return Column(
          children: [
            Text(
              shopName,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            if (address.isNotEmpty && address.any((element) => element != ''))
              Text(
                VFormatters.buildFullAddress(address),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (shopPhone1.isNotEmpty && shopPhone1 != '')
                  Text(
                    VFormatters.formatPhoneNumber(shopPhone1),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                  ),
                if (shopPhone1.isNotEmpty &&
                    shopPhone1 != '' &&
                    shopPhone2.isNotEmpty &&
                    shopPhone2 != '')
                  Text(' - ',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: textColor)),
                if (shopPhone2.isNotEmpty && shopPhone2 != '')
                  Text(
                    VFormatters.formatPhoneNumber(shopPhone2),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                  ),
              ],
            ),
            if (shopDescription.isNotEmpty && shopDescription != '')
              Text(
                shopDescription,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        );
      },
    );
  }
}
