import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/providers/common_providers/reset_default_providers.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/sheet/checkout/return_checkout_sheet.dart';
import '../../../../core/models/return_related_model/return_model.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../core/providers/return_providers/return_related_providers.dart';
import '../../../../core/providers/common_providers/total_amount_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/messages/snackbar.dart';
import '../../initial/return/widgets/returned_item_list.dart';
import '../widgets/billing_amount_section.dart';
import '../widgets/billing_payment_section.dart';

class ReturnCheckoutScreen extends ConsumerWidget {
  ReturnCheckoutScreen({
    required this.returnedItems,
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final List<ReturnItem> returnedItems;

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
    final subtotal = ref.watch(subtotalPriceProvider);
    final paidAmountController = ref.watch(paidAmountControllerProvider);
    final discountAmount = ref.watch(discountProvider);
    final returnNotifier = ref.read(returnNotifierProvider.notifier);
    final total = ref.watch(totalAmountProvider);

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
                    returnNotifier.clearCart();
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
                  const ReturnedItemList(isCheckout: true),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  /// billing section
                  VRoundedContainer(
                    padding: const EdgeInsets.all(VSizes.md),
                    showBorder: true,
                    backgroundColor: isDark ? VColors.black : VColors.white,
                    child: Column(
                      children: [
                        // pricing
                        VBillingAmountSection(formKey: _formKey),

                        const SizedBox(height: VSizes.spaceBtwItems),

                        // divider
                        const Divider(),
                        const SizedBox(height: VSizes.spaceBtwItems),

                        // payment method
                        const VBillingPaymentSection(),
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
            Flexible(
              child: Text(
                  'Total: $currencySign${VFormatters.formatPrice(total)}',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            ElevatedButton.icon(
              icon: const Icon(Iconsax.shopping_cart5),
              // Inside the ElevatedButton onPressed method
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final checkoutController = ref.read(returnCheckoutProvider);

                  // Calculate amounts
                  final paidAmount =
                      double.tryParse(paidAmountController.text) ?? 0.00;
                  final debtAmount = total - paidAmount;
                  if (paidAmount > total) {
                    // Show error message
                    VSnackbar.error(
                        'Exceed total amount: $currencySign${VFormatters.formatPrice(total)}');

                    return;
                  }
                  String paymentStatus = _determinePaymentStatus(debtAmount);

                  showReturnCheckoutBottomSheet(
                    context: context,
                    ref: ref,
                    paidAmount: paidAmount,
                    debtAmount: debtAmount,
                    checkoutController: checkoutController,
                    returnedItems: returnedItems,
                    subtotal: subtotal,
                    discountAmount: discountAmount,
                    shippingFee: shippingFee,
                    taxFee: taxFee,
                    selectedPayment: selectedPayment,
                    paymentStatus: paymentStatus,
                    totalPrice: total,
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
