import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/device/device_utility.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

import '../../../../../common/widgets/sheet/add_sheets/add_new_supplier_sheet.dart';
import '../../../../../core/providers/common_providers/default_providers.dart';
import '../../../../../core/providers/supplier_providers/supplier_related_providers.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';

class VSupplierAndClear extends StatelessWidget {
  const VSupplierAndClear({
    super.key,
    required this.clearAllOnPressed,
  });

  final VoidCallback clearAllOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final supplierName = ref.watch(supplierNameProvider);
            final suppliers = ref.watch(supplierNotifierProvider);

            return TextButton(
              onPressed: () async {
                final selectedSupplier = await showModalBottomSheet<String>(
                  enableDrag: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: VSpacingStyle.horizontal,
                      height: VDeviceUtils.getScreenHeight(context) * 0.5,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.selectSupplier,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              IconButton(
                                onPressed: () async {
                                  context.pop();
                                  await addNewSupplierBottomSheet(context, ref);
                                },
                                icon: const Icon(Iconsax.add_circle5),
                              )
                            ],
                          ),
                          const SizedBox(height: VSizes.spaceBtwItems),
                          Expanded(
                            child: ListView.separated(
                              itemCount: suppliers.length,
                              itemBuilder: (context, index) {
                                if (index < suppliers.length) {
                                  final supplier = suppliers[index];

                                  final supplierComponents = [
                                    supplier.street,
                                    supplier.city,
                                    supplier.state,
                                    supplier.country,
                                  ];

                                  final address = supplierComponents
                                      .where((component) =>
                                          component != null &&
                                          component.isNotEmpty)
                                      .join(', ');

                                  return ListTile(
                                    contentPadding:
                                        VSpacingStyle.halfHorizontal,
                                    tileColor:
                                        Colors.orange.withValues(alpha: 0.3),
                                    title: Text(supplier.name),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (supplier.phoneNumber != null)
                                          Text(supplier.phoneNumber ?? ''),
                                        if (address.isNotEmpty) Text(address),
                                      ],
                                    ),
                                    onTap: () {
                                      ref
                                          .read(supplierNameProvider.notifier)
                                          .state = supplier.name;
                                      ref
                                          .read(supplierPhoneProvider.notifier)
                                          .state = supplier.phoneNumber ?? '';
                                      ref
                                          .read(
                                              supplierAddressProvider.notifier)
                                          .state = address;
                                      ref
                                          .read(supplierIDProvider.notifier)
                                          .state = supplier.id;
                                      context.pop(supplier.name);
                                    },
                                  );
                                }
                                return Container();
                              },
                              separatorBuilder: (_, index) => const SizedBox(
                                  height: VSizes.spaceBtwItems / 2),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );

                // If a new supplier was selected, update the name provider
                if (selectedSupplier != null && selectedSupplier.isNotEmpty) {
                  ref.read(supplierNameProvider.notifier).state =
                      selectedSupplier;
                }
              },
              child: Text(
                '${context.loc.supplier}:\n$supplierName',
                style: const TextStyle(color: VColors.white),
              ),
            );
          },
        ),
        TextButton(
          onPressed: clearAllOnPressed,
          child: Text(
            context.loc.clearAll,
            style: const TextStyle(color: VColors.white),
          ),
        ),
      ],
    );
  }
}
