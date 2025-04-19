import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/models/sell_related_model/sell_model.dart';
import 'package:invobay/core/providers/common_providers/reset_default_providers.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/dialogs/sell_checkout_confirm_dialog.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../../core/providers/sell_providers/total_checkout_provider.dart';
import '../../../../core/providers/sell_providers/update_subtotal_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../sell/widgets/sell_item_list.dart';
import '../widgets/billing_address_section.dart';
import '../widgets/billing_amount_section.dart';
import '../widgets/billing_payment_section.dart';
import '../widgets/discount_code.dart';

class SellCheckoutScreen extends ConsumerWidget {
  SellCheckoutScreen({
    required this.soldItems,
    required this.totalPrice,
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final List<SellItem> soldItems;
  final double totalPrice;

  String _determinePaymentStatus(double debtAmount) {
    return debtAmount == 0 ? 'Completed' : 'Pending';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final currencySign = ref.watch(currencySignProvider);
    final selectedPayment = ref.watch(selectedPaymentProvider);
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    final subtotal = ref.watch(discountedSubtotal);
    final customerId = ref.watch(customerIDProvider);
    final paidAmountController = ref.watch(paidAmountControllerProvider);
    final discountAmount = ref.watch(discountProvider);
    final sellNotifier = ref.read(sellNotifierProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VCustomAppBar(
              text: 'Checkout Review',
              showBackArrow: false,
              actions: [
                IconButton(
                  onPressed: () {
                    context.pop();
                    sellNotifier.clearCart();
                    resetProviders(ref);
                  },
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: VColors.white,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  // items in cart
                  const SellItemList(isCheckout: true),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  // coupon textField
                  VDiscountCode(),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// billing section
                  VRoundedContainer(
                    padding: const EdgeInsets.all(VSizes.md),
                    showBorder: true,
                    backgroundColor: isDark ? VColors.black : VColors.white,
                    child: Column(
                      children: [
                        // pricing

                        VBillingAmountSection(
                            subtotalPrice: totalPrice, formKey: _formKey),

                        const SizedBox(height: VSizes.spaceBtwItems),

                        // divider
                        const Divider(),
                        const SizedBox(height: VSizes.spaceBtwItems),

                        // payment method
                        const VBillingPaymentSection(),

                        const SizedBox(height: VSizes.spaceBtwItems),

                        // address
                        const VBillingAddressSection(isSell: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: VSizes.defaultSpace / 2, horizontal: VSizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(builder: (context, ref, child) {
              final total = ref.watch(totalAmountProvider);

              return Flexible(
                child: Text(
                    'Total: $currencySign${VFormatters.formatPrice(total)}',
                    style: Theme.of(context).textTheme.headlineSmall),
              );
            }),
            ElevatedButton.icon(
              icon: const Icon(Iconsax.shopping_cart5),
              // Inside the ElevatedButton onPressed method
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final checkoutController = ref.read(sellCheckoutProvider);

                  // Calculate amounts
                  final paidAmount =
                      double.tryParse(paidAmountController.text) ?? 0.00;
                  final totalAmount = ref.read(totalAmountProvider);
                  final debtAmount = totalAmount - paidAmount;
                  if (paidAmount > totalAmount) {
                    // Show error message
                    VHelperFunctions.showSnackBar(
                        context: context,
                        message:
                            'Exceed total amount: $currencySign${VFormatters.formatPrice(totalAmount)}');
                    return;
                  }
                  String paymentStatus = _determinePaymentStatus(debtAmount);

                  // Show confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return VSellCheckoutConfirmDialog(
                        totalAmount: totalAmount,
                        paidAmount: paidAmount,
                        debtAmount: debtAmount,
                        checkoutController: checkoutController,
                        soldItems: soldItems,
                        subtotal: subtotal,
                        discountAmount: discountAmount,
                        shippingFee: shippingFee,
                        taxFee: taxFee,
                        selectedPayment: selectedPayment,
                        customerId: customerId,
                        paymentStatus: paymentStatus,
                      );
                    },
                  );
                }
              },
              label: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
