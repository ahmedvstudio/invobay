import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/personalization/address/widgets/single_address.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../core/providers/db_notifiers/app_providers.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class AddressScreen extends ConsumerWidget {
  final bool isCustomer;

  const AddressScreen({
    super.key,
    required this.isCustomer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerNotifierProvider);
    final suppliers = ref.watch(supplierNotifierProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: isCustomer
            ? () => context.pushNamed(VRouter.addNewCustomer)
            : () => context.pushNamed(VRouter.addNewSupplier),
        backgroundColor: VColors.primary,
        child: const Icon(Iconsax.add, color: VColors.white),
      ),
      appBar: VAppBar(
        showBackArrow: true,
        title: Text(isCustomer ? 'Customers' : 'Suppliers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: isCustomer
              ? Column(
                  children: customers.map((customer) {
                    final customerComponents = [
                      customer.postalCode,
                      customer.street,
                      customer.city,
                      customer.state,
                      customer.country,
                    ];

                    final address = customerComponents
                        .where((component) =>
                            component != null && component.isNotEmpty)
                        .join(', ');

                    return VSingleAddress(
                      onTap: () => context.goNamed(VRouter.editCustomer,
                          pathParameters: {'id': customer.id.toString()}),
                      deleteOnPressed: () async {
                        // Confirm deletion with the user
                        final confirmDelete = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return VDeleteConfirmDialog(
                              isCustomer: isCustomer,
                            );
                          },
                        );
                        if (confirmDelete == true) {
                          try {
                            await ref
                                .read(customerNotifierProvider.notifier)
                                .deleteCustomer(customer.id);
                            if (!context.mounted) return;
                            VHelperFunctions.showSnackBar(
                                context: context,
                                message: 'Customer deleted successfully',
                                bgColor: VColors.success);
                          } catch (e) {
                            if (!context.mounted) return;
                            VHelperFunctions.showSnackBar(
                                context: context,
                                message:
                                    'Error deleting customer: ${e.toString()}');
                          }
                        }
                      },
                      name: customer.name,
                      phoneNumber: customer.phoneNumber ?? '',
                      address: address,
                      isCustomer: isCustomer,
                    );
                  }).toList(),
                )
              : Column(
                  children: suppliers.map((supplier) {
                    final supplierComponents = [
                      supplier.postalCode,
                      supplier.street,
                      supplier.city,
                      supplier.state,
                      supplier.country,
                    ];
                    final address = supplierComponents
                        .where((component) =>
                            component != null && component.isNotEmpty)
                        .join(', ');
                    return VSingleAddress(
                      onTap: () => context.goNamed(VRouter.editSupplier,
                          pathParameters: {'id': supplier.id.toString()}),
                      name: supplier.name,
                      phoneNumber: supplier.phoneNumber ?? '',
                      address: address,
                      isCustomer: isCustomer,
                      deleteOnPressed: () async {
                        final confirmDelete = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return VDeleteConfirmDialog(
                              isCustomer: isCustomer,
                            );
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
                    );
                  }).toList(),
                ),
        ),
      ),
    );
  }
}
