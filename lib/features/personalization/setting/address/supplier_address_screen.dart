import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/personalization/setting/address/widgets/single_address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../../common/widgets/sheet/address_action_sheet.dart';
import '../../../../core/providers/supplier_providers/supplier_related_providers.dart';

class SupplierAddressScreen extends ConsumerWidget {
  const SupplierAddressScreen({super.key, required this.isCustomer});

  final bool isCustomer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliers = ref.watch(supplierNotifierProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(VRouter.addNewSupplier),
        backgroundColor: VColors.primary,
        child: const Icon(Iconsax.add, color: VColors.white),
      ),
      appBar: const VAppBar(
        showBackArrow: true,
        title: Text('Suppliers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: suppliers.map((supplier) {
              final address = VFormatters.buildFullAddress([
                supplier.street,
                supplier.city,
                supplier.state,
                supplier.country,
              ]);

              return VSingleAddress(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) => AddressActionSheet(
                      context: context,
                      isCustomer: isCustomer,
                      id: supplier.id,
                      phone1: supplier.phoneNumber,
                      phone2: supplier.extraPhoneNumber,
                      onDelete: () async {
                        final confirmDelete = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return VDeleteConfirmDialog(isCustomer: isCustomer);
                          },
                        );
                        if (confirmDelete == true) {
                          try {
                            await ref
                                .read(supplierNotifierProvider.notifier)
                                .deleteSupplier(supplier.id);
                            if (!context.mounted) return;
                            VHelperFunctions.showSnackBar(
                                context: context,
                                message: 'Supplier deleted successfully',
                                bgColor: VColors.success);
                          } catch (e) {
                            if (!context.mounted) return;
                            VHelperFunctions.showSnackBar(
                                context: context,
                                message:
                                    'Error deleting supplier: ${e.toString()}');
                          }
                        }
                      },
                      onEdit: () {
                        context.goNamed(
                          VRouter.editSupplier,
                          pathParameters: {'id': supplier.id.toString()},
                        );
                      },
                    ),
                  );
                },
                name: supplier.name,
                phoneNumber: supplier.phoneNumber ?? '',
                address: address,
                extraPhoneNumber: supplier.extraPhoneNumber ?? '',
                isCustomer: isCustomer,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
