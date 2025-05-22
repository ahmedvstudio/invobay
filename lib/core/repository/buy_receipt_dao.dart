import 'package:drift/drift.dart' as drift;
import 'package:invobay/core/database/drift/app_database.dart';

import '../models/buy_related_model/buy_model.dart';
import '../models/buy_related_model/buy_with_payment_model.dart';
import '../models/report_related_models/top_supplier_model.dart';

class BuyReceiptDao {
  final AppDatabase db;

  BuyReceiptDao(this.db);

  Future<int> saveBuyReceipt({
    required List<BuyItem> boughtItems,
    required double subTotalPrice,
    required double totalPrice,
    required double discount,
    required double shippingFee,
    required double taxFee,
    required String paymentMethod,
    required String paymentStatus,
    required String discountType,
    required double amountPaid,
    required double amountDebt,
    int? supplierId,
  }) async {
    return await db.transaction(() async {
      // Insert into BuyReceipts
      final receiptId = await db.into(db.buyReceipts).insert(
            BuyReceiptsCompanion(
              supplierId: drift.Value(supplierId),
              subTotalPrice: drift.Value(subTotalPrice),
              discount: drift.Value(discount),
              discountType: drift.Value(discountType),
              shippingFee: drift.Value(shippingFee),
              taxFee: drift.Value(taxFee),
              totalPrice: drift.Value(totalPrice),
            ),
          );

      // Insert BuyReceiptItems
      for (var item in boughtItems) {
        await db.into(db.buyReceiptItems).insert(
              BuyReceiptItemsCompanion(
                receiptId: drift.Value(receiptId),
                itemId: drift.Value(item.item.id),
                quantity: drift.Value(item.quantity),
                price: drift.Value(item.price),
              ),
            );
      }

      // Insert Payment Details
      await db.into(db.buyPayments).insert(
            BuyPaymentsCompanion(
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

  Stream<List<BuyReceiptsWithPaymentModel>> watchReceiptsWithPayments() {
    return (db.select(db.buyReceipts).join([
      drift.innerJoin(db.buyPayments,
          db.buyPayments.receiptId.equalsExp(db.buyReceipts.id)),
    ])
          ..orderBy([
            drift.OrderingTerm.desc(db.buyReceipts.date),
          ]))
        .watch()
        .map((rows) {
      return rows.map((row) {
        final receipt = row.readTable(db.buyReceipts);
        final payment = row.readTable(db.buyPayments);
        return BuyReceiptsWithPaymentModel(
          id: receipt.id,
          date: receipt.date,
          paymentMethod: payment.paymentMethod,
          totalPrice: receipt.totalPrice,
          paidAmount: payment.paidAmount,
          debtAmount: payment.debtAmount,
          paymentStatus: payment.status,
        );
      }).toList();
    });
  }

  Future<void> deleteReceiptsByIds(List<int> ids) async {
    await db.transaction(() async {
      final receiptItems = await (db.select(db.buyReceiptItems)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .get();

      // Group items by itemId to update stock in batch
      final Map<int, double> quantityToRestore = {};
      for (final item in receiptItems) {
        quantityToRestore.update(item.itemId, (qty) => qty - item.quantity,
            ifAbsent: () => item.quantity);
      }

      // Update stock for each affected item
      for (final entry in quantityToRestore.entries) {
        final current = await (db.select(db.items)
              ..where((tbl) => tbl.id.equals(entry.key)))
            .getSingleOrNull();

        if (current != null) {
          final newQty = current.quantity - entry.value;
          await (db.update(db.items)..where((tbl) => tbl.id.equals(entry.key)))
              .write(ItemsCompanion(quantity: drift.Value(newQty)));
        }
      }

      // Delete in batch
      await (db.delete(db.buyReceiptItems)
            ..where((tbl) => tbl.receiptId.isIn(ids)))
          .go();
      await (db.delete(db.buyPayments)..where((tbl) => tbl.receiptId.isIn(ids)))
          .go();
      await (db.delete(db.buyReceipts)..where((tbl) => tbl.id.isIn(ids))).go();
    });
  }

  Future<void> deleteReceipt(int id) async {
    // Fetch sold items associated with the receipt
    final soldItems = await (db.select(db.buyReceiptItems)
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
        final newQuantity = currentItem.quantity - item.quantity;

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
    await (db.delete(db.buyReceipts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updatePaymentDetails({
    required int receiptId,
    required double newPaidAmount,
    required double newDebtAmount,
    required String newPaymentStatus,
  }) async {
    await db.transaction(() async {
      // Update Payment Details
      await (db.update(db.buyPayments)
            ..where((tbl) => tbl.receiptId.equals(receiptId)))
          .write(
        BuyPaymentsCompanion(
          paidAmount: drift.Value(newPaidAmount),
          debtAmount: drift.Value(newDebtAmount),
          status: drift.Value(newPaymentStatus),
        ),
      );
    });
  }

  Stream<List<SupplierSpendModel>> watchTopSuppliers() {
    final query = db.customSelect(
      '''
    SELECT s.id, s.name, SUM(bp.paid_amount) AS total_spent
    FROM buy_receipts br
    JOIN suppliers s ON s.id = br.supplier_id
    JOIN buy_payments bp ON bp.receipt_id = br.id
    GROUP BY s.id
    ORDER BY total_spent DESC
    LIMIT 5
    ''',
      readsFrom: {db.buyReceipts, db.buyPayments, db.suppliers},
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        return SupplierSpendModel(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          totalSpent: row.read<double>('total_spent'),
        );
      }).toList();
    });
  }

  Stream<List<SupplierDebtModel>> watchSupplierDebts() {
    final query = db.customSelect(
      '''
    SELECT s.id, s.name, SUM(bp.debt_amount) AS total_debt
    FROM buy_receipts br
    JOIN suppliers s ON s.id = br.supplier_id
    JOIN buy_payments bp ON bp.receipt_id = br.id
    GROUP BY s.id
    HAVING total_debt > 0
    ORDER BY total_debt DESC
    ''',
      readsFrom: {db.buyReceipts, db.buyPayments, db.suppliers},
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        return SupplierDebtModel(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          totalDebt: row.read<double>('total_debt'),
        );
      }).toList();
    });
  }

  Stream<List<MostBoughtItemModel>> watchMostBoughtItems() {
    final query = db.customSelect(
      '''
    SELECT i.id, i.name, 
           SUM(bri.quantity) AS total_quantity,
           SUM(bri.quantity * bri.price) AS total_spent
    FROM buy_receipt_items bri
    JOIN items i ON i.id = bri.item_id
    GROUP BY i.id
    ORDER BY total_spent DESC
    LIMIT 5
    ''',
      readsFrom: {db.buyReceiptItems, db.items},
    );

    return query.watch().map((rows) {
      return rows
          .map((row) => MostBoughtItemModel(
                id: row.read<int>('id'),
                name: row.read<String>('name'),
                totalQuantity: row.read<double>('total_quantity'),
                totalSpent: row.read<double>('total_spent'),
              ))
          .toList();
    });
  }

  Stream<List<ItemAverageCostModel>> watchAverageCostPerItem() {
    final query = db.customSelect(
      '''
    SELECT i.id, i.name, AVG(bri.price) AS avg_cost
    FROM buy_receipt_items bri
    JOIN items i ON i.id = bri.item_id
    GROUP BY i.id
    ORDER BY avg_cost DESC
    ''',
      readsFrom: {db.buyReceiptItems, db.items},
    );

    return query.watch().map((rows) {
      return rows.map((row) {
        return ItemAverageCostModel(
          id: row.read<int>('id'),
          name: row.read<String>('name'),
          averageCost: row.read<double>('avg_cost'),
        );
      }).toList();
    });
  }
}
