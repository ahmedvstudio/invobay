import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:invobay/core/models/sell_model.dart';
import 'package:invobay/core/providers/customer_provider.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

import '../../../core/services/receipt_printing.dart';

class SellReceiptScreen extends ConsumerWidget {
  final List<SellItem> soldItems;
  final double totalPrice;

  const SellReceiptScreen({
    super.key,
    required this.soldItems,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerName = ref.watch(customerNameProvider);
    final String dateTime =
        DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text('Sell Receipt')),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🧾 Header Section
            Text('Customer: $customerName',
                style: const TextStyle(fontSize: 18)),
            Text('Date: $dateTime',
                style: const TextStyle(fontSize: 16, color: Colors.grey)),

            const SizedBox(height: VSizes.spaceBtwSections),

            // 📜 Items List
            Expanded(
              child: ListView.builder(
                itemCount: soldItems.length,
                itemBuilder: (context, index) {
                  final item = soldItems[index];
                  return ListTile(
                    title: Text(item.item.name,
                        style: const TextStyle(fontSize: 16)),
                    subtitle:
                        Text('${item.quantity} × \$${item.item.sellingPrice}'),
                    trailing: Text(
                      '\$${(item.quantity * item.item.sellingPrice).toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // 💰 Total Price
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: VSizes.spaceBtwItems),

            // 🖨️ Print or Share Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ReceiptPrinter.printReceipt(
                    context: context,
                    items: soldItems,
                    totalPrice: totalPrice,
                    customerName: customerName,
                    footerNote: 'Thank you for your purchase!',
                  );
                },
                child: const Text('Print / Share Receipt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
