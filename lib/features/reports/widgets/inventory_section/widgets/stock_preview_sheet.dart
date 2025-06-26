import 'package:flutter/material.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/common/widgets/list_tiles/report_item.dart';
import 'package:invobay/common/widgets/text/section_heading.dart';
import 'package:invobay/core/database/drift/app_database.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

Future<void> showStockPreviewBottomSheet(
  BuildContext context, {
  required String title,
  required List<Item> items,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(VSizes.defaultSpace),
      ),
    ),
    builder: (context) => StockPreviewBottomSheet(title: title, items: items),
  );
}

class StockPreviewBottomSheet extends StatelessWidget {
  final String title;
  final List<Item> items;

  const StockPreviewBottomSheet({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: VSpacingStyle.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSectionHeading(title: title, showActionButton: false),
            const SizedBox(height: VSizes.spaceBtwItems),
            if (items.isEmpty)
              Padding(
                padding: VSpacingStyle.vertical,
                child: Text(context.loc.NoItemsToDisplay),
              )
            else
              SizedBox(
                height: VDeviceUtils.getScreenHeight(context) * 0.5,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return VReportItem(
                      itemNumber: '${index + 1}',
                      itemName: item.name,
                      subtitle: item.itemUnit.toString(),
                      trailing: item.quantity.toString(),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
