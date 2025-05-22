import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import '../../../core/database/drift/app_database.dart';
import '../../../features/inventory/item_details/widgets/meta_data_section.dart';
import '../text/section_heading.dart';

void showStockPreviewBottomSheet(
  BuildContext context, {
  required String title,
  required List<Item> items,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: VColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(VSizes.defaultSpace)),
    ),
    builder: (context) => _StockPreviewSheet(title: title, items: items),
  );
}

class _StockPreviewSheet extends StatelessWidget {
  final String title;
  final List<Item> items;

  const _StockPreviewSheet({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (_, scrollController) => Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          children: [
            VSectionHeading(
              title: title,
              buttonTitle: 'Close',
              onPressed: () => context.pop(),
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            if (items.isEmpty)
              const Text("No items to display.")
            else
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        title: Text(item.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: VMetaDataSection(
                            tag: "Quantity",
                            showIcon: false,
                            tagBackgroundColor: VColors.info,
                            tagTextColor: VColors.white,
                            child: Text(VFormatters.formatPrice(item.quantity)),
                          ),
                        ),
                      ),
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
