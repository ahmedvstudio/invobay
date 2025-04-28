import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';
import 'package:invobay/features/personalization/setting/address/widgets/single_address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/dialogs/delete_confirm_dialog.dart';
import '../../../../common/widgets/sheet/address_action_sheet.dart';
import '../../../../core/providers/customer_providers/customer_related_providers.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/formatters/formatters.dart';

class CustomerAddressScreen extends ConsumerWidget {
  const CustomerAddressScreen({
    super.key,
    required this.isCustomer,
  });
  final bool isCustomer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(VRouter.addNewCustomer),
        backgroundColor: VColors.primary,
        child: const Icon(Iconsax.add, color: VColors.white),
      ),
      appBar: const VAppBar(
        showBackArrow: true,
        title: Text('Customers'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(VSizes.defaultSpace),
            child:

                /// --> Customers
                Column(
              children: customers.map((customer) {
                final address = VFormatters.buildFullAddress([
                  customer.street,
                  customer.city,
                  customer.state,
                  customer.country,
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
                        id: customer.id,
                        phone1: customer.phoneNumber,
                        phone2: customer.extraPhoneNumber,
                        onDelete: () async {
                          final confirmDelete = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return VDeleteConfirmDialog(
                                  isCustomer: isCustomer);
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
                        onEdit: () {
                          context.goNamed(
                            VRouter.editCustomer,
                            pathParameters: {'id': customer.id.toString()},
                          );
                        },
                      ),
                    );
                  },
                  name: customer.name,
                  phoneNumber: customer.phoneNumber ?? '',
                  address: address,
                  isCustomer: true,
                  extraPhoneNumber: customer.extraPhoneNumber ?? '',
                );
              }).toList(),
            )),
      ),
    );
  }
}
