import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/models/sell_model.dart';
import 'package:invobay/features/checkout/widgets/billing_address_section.dart';
import 'package:invobay/features/checkout/widgets/billing_amount_section.dart';
import 'package:invobay/features/checkout/widgets/billing_payment_section.dart';
import 'package:invobay/features/checkout/widgets/discount_code.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../core/providers/db_notifiers/app_providers.dart';
import '../../core/providers/default_providers.dart';
import '../../core/providers/payment_provider.dart';
import '../../core/providers/reset_default_providers.dart';
import '../../core/providers/sell_related_providers/total_checkout_provider.dart';
import '../../core/providers/sell_related_providers/update_subtotal_provider.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';
import '../sell/widgets/sell_item_list.dart';

class SellCheckoutScreen extends ConsumerWidget {
  const SellCheckoutScreen({
    required this.soldItems,
    required this.totalPrice,
    super.key,
  });

  final List<SellItem> soldItems;
  final double totalPrice;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = VHelperFunctions.isDarkMode(context);
    final currencySign = ref.watch(currencySignProvider);
    final selectedPayment = ref.watch(selectedPaymentProvider);
    final discountController = ref.watch(discountControllerProvider);
    final shippingFee = ref.watch(shippingFeeProvider);
    final taxFee = ref.watch(taxFeeProvider);
    final subtotal = ref.watch(discountedSubtotal);
    final customerId = ref.watch(customerIDProvider);

    return Scaffold(
      appBar: const VAppBar(
        title: Text('Checkout Review'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          subtotalPrice: totalPrice,
                        ),
                        const SizedBox(height: VSizes.spaceBtwItems),

                        // divider
                        const Divider(),
                        const SizedBox(height: VSizes.spaceBtwItems),
                        // payment method
                        const VBillingPaymentSection(),

                        const SizedBox(height: VSizes.spaceBtwItems),

                        // address
                        const VBillingAddressSection(),
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
        padding: const EdgeInsets.only(
            bottom: VSizes.defaultSpace,
            left: VSizes.defaultSpace,
            right: VSizes.defaultSpace),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(builder: (context, ref, child) {
              final total = ref.watch(totalAmountProvider);
              return Flexible(
                  child: Text('Total: $currencySign${total.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headlineSmall));
            }),
            ElevatedButton.icon(
              icon: const Icon(Iconsax.shopping_cart5),
              onPressed: () async {
                final checkoutController = ref.read(sellCheckoutProvider);

                await checkoutController.checkout(
                  soldItems: soldItems,
                  totalPrice: subtotal,
                  discount: double.tryParse(discountController.text) ?? 0.00,
                  shippingFee: shippingFee,
                  taxFee: taxFee,
                  paymentMethod: selectedPayment.name,
                  customerId: customerId,
                  ref: ref,
                );
                if (context.mounted) {
                  VHelperFunctions.showSnackBar(
                      context: context,
                      message: 'Receipt Saved & Stock Updated!');
                  // Reset default providers
                  resetProviders(ref);

                  context.pop(); // Close checkout screen after saving
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
