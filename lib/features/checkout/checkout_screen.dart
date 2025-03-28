import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/models/sell_model.dart';
import 'package:invobay/features/checkout/widgets/billing_address_section.dart';
import 'package:invobay/features/checkout/widgets/billing_amount_section.dart';
import 'package:invobay/features/checkout/widgets/billing_payment_section.dart';
import 'package:invobay/features/checkout/widgets/discount_code.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../core/providers/default_providers.dart';
import '../../core/providers/sell_related_providers/total_checkout_provider.dart';
import '../../core/services/receipt_printing.dart';
import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/sizes.dart';
import '../../core/utils/helpers/helper_functions.dart';
import '../sell/widgets/sell_item_list.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({
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
    final customerName = ref.watch(customerNameProvider);

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
      bottomNavigationBar: SizedBox(
        height: 80,
        child: ElevatedButton(
          onPressed: () async {
            // final db = AppDatabase.getInstance();
            // final total = ref.read(totalAmountProvider);
            // final customerName = ref.read(customerNameProvider);
            //
            // // Insert the receipts and get the receipts ID
            // final receiptId = await db.insertReceipt(total, customerName);
            //
            // // Insert receipts items
            // await db.insertReceiptItems(receiptId, soldItems);
            //
            // // Show a confirmation message
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(content: Text('Receipt saved successfully!')),
            // );
            //
            // // TODO: Navigate to the receipts page or clear the cart
            // context.pop();
          },
          child: Consumer(builder: (context, ref, child) {
            final total = ref.watch(totalAmountProvider);
            return Text('Checkout $currencySign${total.toStringAsFixed(2)}');
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ReceiptPrinter.printReceipt(
            context: context,
            items: soldItems,
            totalPrice: totalPrice,
            customerName: customerName,
            footerNote: 'Thank you for your purchase!',
          );
        },
      ),
    );
  }
}
