import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/models/sell_related_model/sell_model.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/formatters/formatters.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/sheet/checkout/sell_checkout_sheet.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/db_providers/hive_providers/app_settings_provider.dart';
import '../../../../core/providers/payment_providers/payment_provider.dart';
import '../../../../core/providers/sell_providers/sell_related_providers.dart';
import '../../../../core/providers/common_providers/total_amount_provider.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/helpers/helper_functions.dart';
import '../../../../core/utils/messages/snackbar.dart';
import '../../initial/sell/widgets/sell_item_list.dart';
import '../widgets/add_fees_button.dart';
import '../widgets/billing_address_section.dart';
import '../widgets/billing_amount_section.dart';
import '../widgets/billing_payment_section.dart';
import '../widgets/discount_code.dart';

class SellCheckoutScreen extends ConsumerWidget {
  SellCheckoutScreen({
    required this.soldItems,
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final List<SellItem> soldItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final currencySign = ref.watch(currencySignProvider);
    final selectedPayment = ref.watch(selectedPaymentProvider);
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    final subtotal = ref.watch(subtotalPriceProvider);
    final customerId = ref.watch(customerIDProvider);
    final paidAmountController = ref.watch(paidAmountControllerProvider);
    final discountAmount = ref.watch(discountProvider);
    final total = ref.watch(totalAmountProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VCustomAppBar(text: context.loc.checkoutReview),
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  // items in cart
                  const SellItemList(isCheckout: true),
                  const SizedBox(height: VSizes.spaceBtwSections),

                  // coupon textField
                  VDiscountCode(),
                  const SizedBox(height: VSizes.spaceBtwItems / 2),

                  /// Add Fees Section
                  const VAddFeesButton(),

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
            Flexible(
              child: Text(
                  '${context.loc.total}: $currencySign${VFormatters.formatPrice(total)}',
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            ElevatedButton.icon(
              icon: const Icon(Iconsax.shopping_cart5),
              // Inside the ElevatedButton onPressed method
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final checkoutController = ref.read(sellCheckoutProvider);

                  // Calculate amounts
                  final paidAmount =
                      double.tryParse(paidAmountController.text) ?? 0.00;
                  final debtAmount = total - paidAmount;
                  if (paidAmount > total) {
                    // Show error message
                    VSnackbar.error(
                        '${context.loc.exceedTotalAmount}: $currencySign${VFormatters.formatPrice(total)}');

                    return;
                  }
                  String paymentStatus =
                      VHelperFunctions.paymentStatus(debtAmount);

                  showSellCheckoutBottomSheet(
                    context: context,
                    ref: ref,
                    paidAmount: paidAmount,
                    debtAmount: debtAmount,
                    checkoutController: checkoutController,
                    soldItems: soldItems,
                    subtotal: subtotal,
                    totalPrice: total,
                    discountAmount: discountAmount,
                    shippingFee: shippingFee,
                    taxFee: taxFee,
                    selectedPayment: selectedPayment,
                    customerId: customerId,
                    paymentStatus: paymentStatus,
                  );
                }
              },
              label: Text(context.loc.checkout),
            ),
          ],
        ),
      ),
    );
  }
}
