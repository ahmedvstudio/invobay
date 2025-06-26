import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/list_tiles/report_item.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../core/providers/report_providers/report_related_providers.dart';
import '../../../../../core/utils/constants/sizes.dart';

class MostReturnedItemsBottomSheet extends ConsumerWidget {
  const MostReturnedItemsBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mostReturnedAsync = ref.watch(mostReturnedItemsProvider);

    return SafeArea(
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(
                title: context.loc.mostReturnedItems, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            mostReturnedAsync.when(
              data: (items) {
                if (items.isEmpty) {
                  return Padding(
                    padding: VSpacingStyle.vertical,
                    child: Text(context.loc.noReturnedItemsFound),
                  );
                }
                return SizedBox(
                  height: VDeviceUtils.getScreenHeight(context) * 0.5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return VReportItem(
                          itemNumber: '${index + 1}',
                          itemName: item.itemName,
                          subtitle: context.loc.returned,
                          trailing: '${item.totalReturned} ${context.loc.pcs}');
                    },
                  ),
                );
              },
              loading: () => const Padding(
                padding: VSpacingStyle.vertical,
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (err, _) => Padding(
                padding: VSpacingStyle.vertical,
                child: Text('${context.loc.error}: $err'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
