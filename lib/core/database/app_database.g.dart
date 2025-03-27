// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _sellingPriceMeta =
      const VerificationMeta('sellingPrice');
  @override
  late final GeneratedColumn<double> sellingPrice = GeneratedColumn<double>(
      'selling_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _buyingPriceMeta =
      const VerificationMeta('buyingPrice');
  @override
  late final GeneratedColumn<double> buyingPrice = GeneratedColumn<double>(
      'buying_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _supplierNameMeta =
      const VerificationMeta('supplierName');
  @override
  late final GeneratedColumn<String> supplierName = GeneratedColumn<String>(
      'supplier_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        quantity,
        sellingPrice,
        buyingPrice,
        supplierName,
        description,
        barcode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('selling_price')) {
      context.handle(
          _sellingPriceMeta,
          sellingPrice.isAcceptableOrUnknown(
              data['selling_price']!, _sellingPriceMeta));
    } else if (isInserting) {
      context.missing(_sellingPriceMeta);
    }
    if (data.containsKey('buying_price')) {
      context.handle(
          _buyingPriceMeta,
          buyingPrice.isAcceptableOrUnknown(
              data['buying_price']!, _buyingPriceMeta));
    } else if (isInserting) {
      context.missing(_buyingPriceMeta);
    }
    if (data.containsKey('supplier_name')) {
      context.handle(
          _supplierNameMeta,
          supplierName.isAcceptableOrUnknown(
              data['supplier_name']!, _supplierNameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      sellingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}selling_price'])!,
      buyingPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}buying_price'])!,
      supplierName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final int id;
  final String name;
  final double quantity;
  final double sellingPrice;
  final double buyingPrice;
  final String? supplierName;
  final String? description;
  final String? barcode;
  const Item(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.sellingPrice,
      required this.buyingPrice,
      this.supplierName,
      this.description,
      this.barcode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<double>(quantity);
    map['selling_price'] = Variable<double>(sellingPrice);
    map['buying_price'] = Variable<double>(buyingPrice);
    if (!nullToAbsent || supplierName != null) {
      map['supplier_name'] = Variable<String>(supplierName);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      name: Value(name),
      quantity: Value(quantity),
      sellingPrice: Value(sellingPrice),
      buyingPrice: Value(buyingPrice),
      supplierName: supplierName == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<double>(json['quantity']),
      sellingPrice: serializer.fromJson<double>(json['sellingPrice']),
      buyingPrice: serializer.fromJson<double>(json['buyingPrice']),
      supplierName: serializer.fromJson<String?>(json['supplierName']),
      description: serializer.fromJson<String?>(json['description']),
      barcode: serializer.fromJson<String?>(json['barcode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<double>(quantity),
      'sellingPrice': serializer.toJson<double>(sellingPrice),
      'buyingPrice': serializer.toJson<double>(buyingPrice),
      'supplierName': serializer.toJson<String?>(supplierName),
      'description': serializer.toJson<String?>(description),
      'barcode': serializer.toJson<String?>(barcode),
    };
  }

  Item copyWith(
          {int? id,
          String? name,
          double? quantity,
          double? sellingPrice,
          double? buyingPrice,
          Value<String?> supplierName = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> barcode = const Value.absent()}) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        supplierName:
            supplierName.present ? supplierName.value : this.supplierName,
        description: description.present ? description.value : this.description,
        barcode: barcode.present ? barcode.value : this.barcode,
      );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      sellingPrice: data.sellingPrice.present
          ? data.sellingPrice.value
          : this.sellingPrice,
      buyingPrice:
          data.buyingPrice.present ? data.buyingPrice.value : this.buyingPrice,
      supplierName: data.supplierName.present
          ? data.supplierName.value
          : this.supplierName,
      description:
          data.description.present ? data.description.value : this.description,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('supplierName: $supplierName, ')
          ..write('description: $description, ')
          ..write('barcode: $barcode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, quantity, sellingPrice, buyingPrice,
      supplierName, description, barcode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.sellingPrice == this.sellingPrice &&
          other.buyingPrice == this.buyingPrice &&
          other.supplierName == this.supplierName &&
          other.description == this.description &&
          other.barcode == this.barcode);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> quantity;
  final Value<double> sellingPrice;
  final Value<double> buyingPrice;
  final Value<String?> supplierName;
  final Value<String?> description;
  final Value<String?> barcode;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.buyingPrice = const Value.absent(),
    this.supplierName = const Value.absent(),
    this.description = const Value.absent(),
    this.barcode = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double quantity,
    required double sellingPrice,
    required double buyingPrice,
    this.supplierName = const Value.absent(),
    this.description = const Value.absent(),
    this.barcode = const Value.absent(),
  })  : name = Value(name),
        quantity = Value(quantity),
        sellingPrice = Value(sellingPrice),
        buyingPrice = Value(buyingPrice);
  static Insertable<Item> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? quantity,
    Expression<double>? sellingPrice,
    Expression<double>? buyingPrice,
    Expression<String>? supplierName,
    Expression<String>? description,
    Expression<String>? barcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (sellingPrice != null) 'selling_price': sellingPrice,
      if (buyingPrice != null) 'buying_price': buyingPrice,
      if (supplierName != null) 'supplier_name': supplierName,
      if (description != null) 'description': description,
      if (barcode != null) 'barcode': barcode,
    });
  }

  ItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? quantity,
      Value<double>? sellingPrice,
      Value<double>? buyingPrice,
      Value<String?>? supplierName,
      Value<String?>? description,
      Value<String?>? barcode}) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      supplierName: supplierName ?? this.supplierName,
      description: description ?? this.description,
      barcode: barcode ?? this.barcode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (sellingPrice.present) {
      map['selling_price'] = Variable<double>(sellingPrice.value);
    }
    if (buyingPrice.present) {
      map['buying_price'] = Variable<double>(buyingPrice.value);
    }
    if (supplierName.present) {
      map['supplier_name'] = Variable<String>(supplierName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('sellingPrice: $sellingPrice, ')
          ..write('buyingPrice: $buyingPrice, ')
          ..write('supplierName: $supplierName, ')
          ..write('description: $description, ')
          ..write('barcode: $barcode')
          ..write(')'))
        .toString();
  }
}

class $ReceiptsTable extends Receipts with TableInfo<$ReceiptsTable, Receipt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, totalPrice, customerName, paymentMethod];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipts';
  @override
  VerificationContext validateIntegrity(Insertable<Receipt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Receipt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Receipt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name']),
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method']),
    );
  }

  @override
  $ReceiptsTable createAlias(String alias) {
    return $ReceiptsTable(attachedDatabase, alias);
  }
}

class Receipt extends DataClass implements Insertable<Receipt> {
  final int id;
  final DateTime date;
  final double totalPrice;
  final String? customerName;
  final String? paymentMethod;
  const Receipt(
      {required this.id,
      required this.date,
      required this.totalPrice,
      this.customerName,
      this.paymentMethod});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['total_price'] = Variable<double>(totalPrice);
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    return map;
  }

  ReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptsCompanion(
      id: Value(id),
      date: Value(date),
      totalPrice: Value(totalPrice),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      paymentMethod: paymentMethod == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentMethod),
    );
  }

  factory Receipt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Receipt(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'customerName': serializer.toJson<String?>(customerName),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
    };
  }

  Receipt copyWith(
          {int? id,
          DateTime? date,
          double? totalPrice,
          Value<String?> customerName = const Value.absent(),
          Value<String?> paymentMethod = const Value.absent()}) =>
      Receipt(
        id: id ?? this.id,
        date: date ?? this.date,
        totalPrice: totalPrice ?? this.totalPrice,
        customerName:
            customerName.present ? customerName.value : this.customerName,
        paymentMethod:
            paymentMethod.present ? paymentMethod.value : this.paymentMethod,
      );
  Receipt copyWithCompanion(ReceiptsCompanion data) {
    return Receipt(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Receipt(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('customerName: $customerName, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, totalPrice, customerName, paymentMethod);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Receipt &&
          other.id == this.id &&
          other.date == this.date &&
          other.totalPrice == this.totalPrice &&
          other.customerName == this.customerName &&
          other.paymentMethod == this.paymentMethod);
}

class ReceiptsCompanion extends UpdateCompanion<Receipt> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> totalPrice;
  final Value<String?> customerName;
  final Value<String?> paymentMethod;
  const ReceiptsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.customerName = const Value.absent(),
    this.paymentMethod = const Value.absent(),
  });
  ReceiptsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required double totalPrice,
    this.customerName = const Value.absent(),
    this.paymentMethod = const Value.absent(),
  }) : totalPrice = Value(totalPrice);
  static Insertable<Receipt> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? totalPrice,
    Expression<String>? customerName,
    Expression<String>? paymentMethod,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (totalPrice != null) 'total_price': totalPrice,
      if (customerName != null) 'customer_name': customerName,
      if (paymentMethod != null) 'payment_method': paymentMethod,
    });
  }

  ReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<double>? totalPrice,
      Value<String?>? customerName,
      Value<String?>? paymentMethod}) {
    return ReceiptsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      totalPrice: totalPrice ?? this.totalPrice,
      customerName: customerName ?? this.customerName,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('customerName: $customerName, ')
          ..write('paymentMethod: $paymentMethod')
          ..write(')'))
        .toString();
  }
}

class $ReceiptItemsTable extends ReceiptItems
    with TableInfo<$ReceiptItemsTable, ReceiptItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _receiptIdMeta =
      const VerificationMeta('receiptId');
  @override
  late final GeneratedColumn<int> receiptId = GeneratedColumn<int>(
      'receipt_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES receipts(id) ON DELETE CASCADE');
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES items(id) ON DELETE CASCADE');
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, receiptId, itemId, quantity, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipt_items';
  @override
  VerificationContext validateIntegrity(Insertable<ReceiptItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('receipt_id')) {
      context.handle(_receiptIdMeta,
          receiptId.isAcceptableOrUnknown(data['receipt_id']!, _receiptIdMeta));
    } else if (isInserting) {
      context.missing(_receiptIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReceiptItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiptId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}receipt_id'])!,
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $ReceiptItemsTable createAlias(String alias) {
    return $ReceiptItemsTable(attachedDatabase, alias);
  }
}

class ReceiptItem extends DataClass implements Insertable<ReceiptItem> {
  final int id;
  final int receiptId;
  final int itemId;
  final double quantity;
  final double price;
  const ReceiptItem(
      {required this.id,
      required this.receiptId,
      required this.itemId,
      required this.quantity,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<int>(receiptId);
    map['item_id'] = Variable<int>(itemId);
    map['quantity'] = Variable<double>(quantity);
    map['price'] = Variable<double>(price);
    return map;
  }

  ReceiptItemsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptItemsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      itemId: Value(itemId),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory ReceiptItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReceiptItem(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<int>(json['receiptId']),
      itemId: serializer.fromJson<int>(json['itemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptId': serializer.toJson<int>(receiptId),
      'itemId': serializer.toJson<int>(itemId),
      'quantity': serializer.toJson<double>(quantity),
      'price': serializer.toJson<double>(price),
    };
  }

  ReceiptItem copyWith(
          {int? id,
          int? receiptId,
          int? itemId,
          double? quantity,
          double? price}) =>
      ReceiptItem(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  ReceiptItem copyWithCompanion(ReceiptItemsCompanion data) {
    return ReceiptItem(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptItem(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, receiptId, itemId, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiptItem &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class ReceiptItemsCompanion extends UpdateCompanion<ReceiptItem> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<int> itemId;
  final Value<double> quantity;
  final Value<double> price;
  const ReceiptItemsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  ReceiptItemsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required int itemId,
    required double quantity,
    required double price,
  })  : receiptId = Value(receiptId),
        itemId = Value(itemId),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<ReceiptItem> custom({
    Expression<int>? id,
    Expression<int>? receiptId,
    Expression<int>? itemId,
    Expression<double>? quantity,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (itemId != null) 'item_id': itemId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  ReceiptItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<int>? itemId,
      Value<double>? quantity,
      Value<double>? price}) {
    return ReceiptItemsCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      itemId: itemId ?? this.itemId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (receiptId.present) {
      map['receipt_id'] = Variable<int>(receiptId.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptItemsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $ReceiptsTable receipts = $ReceiptsTable(this);
  late final $ReceiptItemsTable receiptItems = $ReceiptItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [items, receipts, receiptItems];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('receipts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('receipt_items', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$ItemsTableCreateCompanionBuilder = ItemsCompanion Function({
  Value<int> id,
  required String name,
  required double quantity,
  required double sellingPrice,
  required double buyingPrice,
  Value<String?> supplierName,
  Value<String?> description,
  Value<String?> barcode,
});
typedef $$ItemsTableUpdateCompanionBuilder = ItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> quantity,
  Value<double> sellingPrice,
  Value<double> buyingPrice,
  Value<String?> supplierName,
  Value<String?> description,
  Value<String?> barcode,
});

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get buyingPrice => $composableBuilder(
      column: $table.buyingPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supplierName => $composableBuilder(
      column: $table.supplierName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get buyingPrice => $composableBuilder(
      column: $table.buyingPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supplierName => $composableBuilder(
      column: $table.supplierName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get sellingPrice => $composableBuilder(
      column: $table.sellingPrice, builder: (column) => column);

  GeneratedColumn<double> get buyingPrice => $composableBuilder(
      column: $table.buyingPrice, builder: (column) => column);

  GeneratedColumn<String> get supplierName => $composableBuilder(
      column: $table.supplierName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);
}

class $$ItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemsTable,
    Item,
    $$ItemsTableFilterComposer,
    $$ItemsTableOrderingComposer,
    $$ItemsTableAnnotationComposer,
    $$ItemsTableCreateCompanionBuilder,
    $$ItemsTableUpdateCompanionBuilder,
    (Item, BaseReferences<_$AppDatabase, $ItemsTable, Item>),
    Item,
    PrefetchHooks Function()> {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> sellingPrice = const Value.absent(),
            Value<double> buyingPrice = const Value.absent(),
            Value<String?> supplierName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
          }) =>
              ItemsCompanion(
            id: id,
            name: name,
            quantity: quantity,
            sellingPrice: sellingPrice,
            buyingPrice: buyingPrice,
            supplierName: supplierName,
            description: description,
            barcode: barcode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double quantity,
            required double sellingPrice,
            required double buyingPrice,
            Value<String?> supplierName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
          }) =>
              ItemsCompanion.insert(
            id: id,
            name: name,
            quantity: quantity,
            sellingPrice: sellingPrice,
            buyingPrice: buyingPrice,
            supplierName: supplierName,
            description: description,
            barcode: barcode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemsTable,
    Item,
    $$ItemsTableFilterComposer,
    $$ItemsTableOrderingComposer,
    $$ItemsTableAnnotationComposer,
    $$ItemsTableCreateCompanionBuilder,
    $$ItemsTableUpdateCompanionBuilder,
    (Item, BaseReferences<_$AppDatabase, $ItemsTable, Item>),
    Item,
    PrefetchHooks Function()>;
typedef $$ReceiptsTableCreateCompanionBuilder = ReceiptsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  required double totalPrice,
  Value<String?> customerName,
  Value<String?> paymentMethod,
});
typedef $$ReceiptsTableUpdateCompanionBuilder = ReceiptsCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<double> totalPrice,
  Value<String?> customerName,
  Value<String?> paymentMethod,
});

final class $$ReceiptsTableReferences
    extends BaseReferences<_$AppDatabase, $ReceiptsTable, Receipt> {
  $$ReceiptsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReceiptItemsTable, List<ReceiptItem>>
      _receiptItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.receiptItems,
          aliasName:
              $_aliasNameGenerator(db.receipts.id, db.receiptItems.receiptId));

  $$ReceiptItemsTableProcessedTableManager get receiptItemsRefs {
    final manager = $$ReceiptItemsTableTableManager($_db, $_db.receiptItems)
        .filter((f) => f.receiptId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptItemsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  Expression<bool> receiptItemsRefs(
      Expression<bool> Function($$ReceiptItemsTableFilterComposer f) f) {
    final $$ReceiptItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receiptItems,
        getReferencedColumn: (t) => t.receiptId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptItemsTableFilterComposer(
              $db: $db,
              $table: $db.receiptItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));
}

class $$ReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  Expression<T> receiptItemsRefs<T extends Object>(
      Expression<T> Function($$ReceiptItemsTableAnnotationComposer a) f) {
    final $$ReceiptItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.receiptItems,
        getReferencedColumn: (t) => t.receiptId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.receiptItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ReceiptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReceiptsTable,
    Receipt,
    $$ReceiptsTableFilterComposer,
    $$ReceiptsTableOrderingComposer,
    $$ReceiptsTableAnnotationComposer,
    $$ReceiptsTableCreateCompanionBuilder,
    $$ReceiptsTableUpdateCompanionBuilder,
    (Receipt, $$ReceiptsTableReferences),
    Receipt,
    PrefetchHooks Function({bool receiptItemsRefs})> {
  $$ReceiptsTableTableManager(_$AppDatabase db, $ReceiptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<String?> customerName = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
          }) =>
              ReceiptsCompanion(
            id: id,
            date: date,
            totalPrice: totalPrice,
            customerName: customerName,
            paymentMethod: paymentMethod,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            required double totalPrice,
            Value<String?> customerName = const Value.absent(),
            Value<String?> paymentMethod = const Value.absent(),
          }) =>
              ReceiptsCompanion.insert(
            id: id,
            date: date,
            totalPrice: totalPrice,
            customerName: customerName,
            paymentMethod: paymentMethod,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ReceiptsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({receiptItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (receiptItemsRefs) db.receiptItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (receiptItemsRefs)
                    await $_getPrefetchedData<Receipt, $ReceiptsTable,
                            ReceiptItem>(
                        currentTable: table,
                        referencedTable: $$ReceiptsTableReferences
                            ._receiptItemsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ReceiptsTableReferences(db, table, p0)
                                .receiptItemsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.receiptId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ReceiptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReceiptsTable,
    Receipt,
    $$ReceiptsTableFilterComposer,
    $$ReceiptsTableOrderingComposer,
    $$ReceiptsTableAnnotationComposer,
    $$ReceiptsTableCreateCompanionBuilder,
    $$ReceiptsTableUpdateCompanionBuilder,
    (Receipt, $$ReceiptsTableReferences),
    Receipt,
    PrefetchHooks Function({bool receiptItemsRefs})>;
typedef $$ReceiptItemsTableCreateCompanionBuilder = ReceiptItemsCompanion
    Function({
  Value<int> id,
  required int receiptId,
  required int itemId,
  required double quantity,
  required double price,
});
typedef $$ReceiptItemsTableUpdateCompanionBuilder = ReceiptItemsCompanion
    Function({
  Value<int> id,
  Value<int> receiptId,
  Value<int> itemId,
  Value<double> quantity,
  Value<double> price,
});

final class $$ReceiptItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ReceiptItemsTable, ReceiptItem> {
  $$ReceiptItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ReceiptsTable _receiptIdTable(_$AppDatabase db) =>
      db.receipts.createAlias(
          $_aliasNameGenerator(db.receiptItems.receiptId, db.receipts.id));

  $$ReceiptsTableProcessedTableManager get receiptId {
    final $_column = $_itemColumn<int>('receipt_id')!;

    final manager = $$ReceiptsTableTableManager($_db, $_db.receipts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_receiptIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ReceiptItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptItemsTable> {
  $$ReceiptItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  $$ReceiptsTableFilterComposer get receiptId {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.receiptId,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableFilterComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReceiptItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptItemsTable> {
  $$ReceiptItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  $$ReceiptsTableOrderingComposer get receiptId {
    final $$ReceiptsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.receiptId,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableOrderingComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReceiptItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptItemsTable> {
  $$ReceiptItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  $$ReceiptsTableAnnotationComposer get receiptId {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.receiptId,
        referencedTable: $db.receipts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReceiptsTableAnnotationComposer(
              $db: $db,
              $table: $db.receipts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReceiptItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReceiptItemsTable,
    ReceiptItem,
    $$ReceiptItemsTableFilterComposer,
    $$ReceiptItemsTableOrderingComposer,
    $$ReceiptItemsTableAnnotationComposer,
    $$ReceiptItemsTableCreateCompanionBuilder,
    $$ReceiptItemsTableUpdateCompanionBuilder,
    (ReceiptItem, $$ReceiptItemsTableReferences),
    ReceiptItem,
    PrefetchHooks Function({bool receiptId})> {
  $$ReceiptItemsTableTableManager(_$AppDatabase db, $ReceiptItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> price = const Value.absent(),
          }) =>
              ReceiptItemsCompanion(
            id: id,
            receiptId: receiptId,
            itemId: itemId,
            quantity: quantity,
            price: price,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int receiptId,
            required int itemId,
            required double quantity,
            required double price,
          }) =>
              ReceiptItemsCompanion.insert(
            id: id,
            receiptId: receiptId,
            itemId: itemId,
            quantity: quantity,
            price: price,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReceiptItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({receiptId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (receiptId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.receiptId,
                    referencedTable:
                        $$ReceiptItemsTableReferences._receiptIdTable(db),
                    referencedColumn:
                        $$ReceiptItemsTableReferences._receiptIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ReceiptItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReceiptItemsTable,
    ReceiptItem,
    $$ReceiptItemsTableFilterComposer,
    $$ReceiptItemsTableOrderingComposer,
    $$ReceiptItemsTableAnnotationComposer,
    $$ReceiptItemsTableCreateCompanionBuilder,
    $$ReceiptItemsTableUpdateCompanionBuilder,
    (ReceiptItem, $$ReceiptItemsTableReferences),
    ReceiptItem,
    PrefetchHooks Function({bool receiptId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$ReceiptsTableTableManager get receipts =>
      $$ReceiptsTableTableManager(_db, _db.receipts);
  $$ReceiptItemsTableTableManager get receiptItems =>
      $$ReceiptItemsTableTableManager(_db, _db.receiptItems);
}
