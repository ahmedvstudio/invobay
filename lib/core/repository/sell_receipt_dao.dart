import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/database/drift/app_database.dart';

import '../models/report_related_models/customer_spend_model.dart';
import '../models/sell_related_model/sell_model.dart';
import '../models/sell_related_model/sell_with_payment_model.dart';

class SellReceiptDao {
  final AppDatabase db;

  SellReceiptDao(this.db);

  Future<int> saveSellReceipt({
    required List<SellItem> soldItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String discountType,
    required String paymentStatus,
    required double amountPaid,
    required double amountDebt,
    int? customerId,
  }) async {
    return await db.transaction(() async {
      // Insert into SellReceipts
      final receiptId = await db.into(db.sellReceipts).insert(
            SellReceiptsCompanion(
              customerId: drift.Value(customerId),
              // paymentMethod: drift.Value(paymentMethod),
              subTotalPrice: drift.Value(subTotalPrice),
              discount: drift.Value(discount),
              discountType: drift.Value(discountType),
              shippingFee: drift.Value(shippingFee),
              taxFee: drift.Value(taxFee),
              totalPrice: drift.Value(totalPrice),
            ),
          );

      // Insert SellReceiptItems
      for (var item in soldItems) {
        await db.into(db.sellReceiptItems).insert(
              SellReceiptItemsCompanion(
                receiptId: drift.Value(receiptId),
                itemId: drift.Value(item.item.id),
                quantity: drift.Value(item.quantity),
                price: drift.Value(item.item.sellingPrice),
                costPrice: drift.Value(item.item.buyingPrice),
              ),
            );
      }

      // Insert Payment Details
      await db.into(db.sellPayments).insert(
            SellPaymentsCompanion(
              receiptId: drift.Value(receiptId),
              paymentMethod: drift.Value(paymentMethod),
              paidAmount: drift.Value(amountPaid),
              debtAmount: drift.Value(amountDebt),
              status: drift.Value(paymentStatus),
            ),
          );

      return receiptId;
    });
  }

  Stream<List<SellReceiptsWithPaymentModel>> watchReceiptsWithPayments() {
    return (db.select(db.sellReceipts).join([
      drift.innerJoin(db.sellPayments,
          db.sellPayments.receiptId.equalsExp(db.sellReceipts.id)),
    ])
          ..orderBy([
            drift.OrderingTerm.desc(db.sellReceipts.date),
          ]))
        .watch()
        .map((rows) {
      return rows.map((row) {
        final receipt = row.readTable(db.sellReceipts);
        final payment = row.readTable(db.sellPayments);
        return SellReceiptsWithPaymentModel(
          id: receipt.id,
          date: receipt.date,
          paymentMethod: payment.paymentMethod,
          totalPrice: receipt.totalPrice,
          paidAmount: payment.paidAmount,
          debtAmount: payment.debtAmount,
          paymentStatus: payment.status,
          // Add other fields as necessary
        );
      }).toList();
    });
  }

  Future<void> deleteReceiptsByIds(List<int> ids) async {
    await db.transaction(() async {
      // Get all SellReceiptItems for the given receipts
      final receiptItems = await (db.select(db.sellReceiptItems)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .get();

      // Group items by itemId to update stock in batch
      final Map<int, double> quantityToRestore = {};
      for (final item in receiptItems) {
        quantityToRestore.update(item.itemId, (qty) => qty + item.quantity,
            ifAbsent: () => item.quantity);
      }

      // Update stock for each affected item
      for (final entry in quantityToRestore.entries) {
        final current = await (db.select(db.items)
              ..where((tbl) => tbl.id.equals(entry.key)))
            .getSingleOrNull();

        if (current != null) {
          final newQty = current.quantity + entry.value;
          await (db.update(db.items)..where((tbl) => tbl.id.equals(entry.key)))
              .write(ItemsCompanion(quantity: drift.Value(newQty)));
        }
      }

      // Delete in batch
      await (db.delete(db.sellReceiptItems)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .go();
      await (db.delete(db.sellPayments)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .go();
      await (db.delete(db.sellReceipts)..where((tbl) => tbl.id.isIn(ids))).go();
    });
  }

  Future<void> deleteReceipt(int id) async {
    // Fetch sold items associated with the receipt
    final soldItems = await (db.select(db.sellReceiptItems)
          ..where((tbl) => tbl.receiptId.equals(id)))
        .get();

    // Return quantities to stock
    for (final item in soldItems) {
      // Fetch the current stock quantity for the item
      final currentItemList = await (db.select(db.items)
            ..where((tbl) => tbl.id.equals(item.itemId)))
          .get();

      if (currentItemList.isNotEmpty) {
        final currentItem = currentItemList.first;
        final newQuantity = currentItem.quantity + item.quantity;

        // Update the item quantity in stock
        await (db.update(db.items)..where((tbl) => tbl.id.equals(item.itemId)))
            .write(
          ItemsCompanion(
            quantity: drift.Value(newQuantity),
          ),
        );
      }
    }

    // Now delete the receipt
    await (db.delete(db.sellReceipts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updatePaymentDetails({
    required int receiptId,
    required double newPaidAmount,
    required double newDebtAmount,
    required String newPaymentStatus,
  }) async {
    await db.transaction(() async {
      // Update Payment Details
      await (db.update(db.sellPayments)
            ..where((tbl) => tbl.receiptId.equals(receiptId)))
          .write(
        SellPaymentsCompanion(
          paidAmount: drift.Value(newPaidAmount),
          debtAmount: drift.Value(newDebtAmount),
          status: drift.Value(newPaymentStatus),
        ),
      );
    });
  }

  Stream<List<SellReceiptItemsModel>> watchSoldItemsWithCost() {
    final query = db.select(db.sellReceiptItems).join([
      drift.innerJoin(
        db.items,
        db.items.id.equalsExp(db.sellReceiptItems.itemId),
      ),
      drift.innerJoin(
        db.sellReceipts,
        db.sellReceipts.id.equalsExp(db.sellReceiptItems.receiptId),
      ),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final soldItem = row.readTable(db.sellReceiptItems);
        final item = row.readTable(db.items);
        final receipt = row.readTable(db.sellReceipts);
        return SellReceiptItemsModel(
          id: soldItem.id,
          quantity: soldItem.quantity,
          receiptId: receipt.id,
          itemId: item.id,
          price: soldItem.price,
          costPrice: soldItem.costPrice,
        );
      }).toList();
    });
  }

  Stream<List<CustomerSpendModel>> watchTopCustomers() {
    final query = db.customSelect(
      '''
    SELECT c.id, c.name, SUM(sp.paid_amount) as total_spent
    FROM sell_receipts sr
    JOIN customers c ON c.id = sr.customer_id
    JOIN sell_payments sp ON sp.receipt_id = sr.id
    GROUP BY c.id
    ORDER BY total_spent DESC
    LIMIT 5
    ''',
      readsFrom: {db.sellReceipts, db.sellPayments, db.customers},
    );

    return query.watch().map((rows) {
      return rows
          .map((row) => CustomerSpendModel(
                id: row.read<int>('id'),
                name: row.read<String>('name'),
                totalSpent: row.read<double>('total_spent'),
              ))
          .toList();
    });
  }

  Stream<List<CustomerDebtModel>> watchCustomerDebts() {
    final query = db.customSelect(
      '''
    SELECT c.id, c.name, SUM(sp.debt_amount) as total_debt
    FROM sell_receipts sr
    JOIN customers c ON c.id = sr.customer_id
    JOIN sell_payments sp ON sp.receipt_id = sr.id
    GROUP BY c.id
    HAVING total_debt > 0
    ORDER BY total_debt DESC
    ''',
      readsFrom: {db.sellReceipts, db.sellPayments, db.customers},
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        return CustomerDebtModel(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          totalDebt: row.read<double>('total_debt'),
        );
      }).toList();
    });
  }

  Stream<List<MostSoldItemModel>> watchMostSoldItems() {
    final query = db.customSelect(
      '''
    SELECT i.id, i.name, SUM(sri.quantity) as total_quantity, SUM(sri.price * sri.quantity) as total_revenue
    FROM sell_receipt_items sri
    JOIN items i ON i.id = sri.item_id
    GROUP BY i.id
    ORDER BY total_quantity DESC
    LIMIT 10
    ''',
      readsFrom: {db.sellReceiptItems, db.items},
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        return MostSoldItemModel(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          totalQuantity: row.read<int>('total_quantity'),
          totalRevenue: row.read<double>('total_revenue'),
        );
      }).toList();
    });
  }
  // ...
}
