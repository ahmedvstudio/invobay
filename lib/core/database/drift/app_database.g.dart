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
  static const VerificationMeta _itemUnitMeta =
      const VerificationMeta('itemUnit');
  @override
  late final GeneratedColumn<String> itemUnit = GeneratedColumn<String>(
      'item_unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        quantity,
        sellingPrice,
        buyingPrice,
        description,
        barcode,
        itemUnit
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
    if (data.containsKey('item_unit')) {
      context.handle(_itemUnitMeta,
          itemUnit.isAcceptableOrUnknown(data['item_unit']!, _itemUnitMeta));
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
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      itemUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_unit']),
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
  final String? description;
  final String? barcode;
  final String? itemUnit;
  const Item(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.sellingPrice,
      required this.buyingPrice,
      this.description,
      this.barcode,
      this.itemUnit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<double>(quantity);
    map['selling_price'] = Variable<double>(sellingPrice);
    map['buying_price'] = Variable<double>(buyingPrice);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || itemUnit != null) {
      map['item_unit'] = Variable<String>(itemUnit);
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
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      itemUnit: itemUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(itemUnit),
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
      description: serializer.fromJson<String?>(json['description']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      itemUnit: serializer.fromJson<String?>(json['itemUnit']),
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
      'description': serializer.toJson<String?>(description),
      'barcode': serializer.toJson<String?>(barcode),
      'itemUnit': serializer.toJson<String?>(itemUnit),
    };
  }

  Item copyWith(
          {int? id,
          String? name,
          double? quantity,
          double? sellingPrice,
          double? buyingPrice,
          Value<String?> description = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          Value<String?> itemUnit = const Value.absent()}) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        sellingPrice: sellingPrice ?? this.sellingPrice,
        buyingPrice: buyingPrice ?? this.buyingPrice,
        description: description.present ? description.value : this.description,
        barcode: barcode.present ? barcode.value : this.barcode,
        itemUnit: itemUnit.present ? itemUnit.value : this.itemUnit,
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
      description:
          data.description.present ? data.description.value : this.description,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      itemUnit: data.itemUnit.present ? data.itemUnit.value : this.itemUnit,
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
          ..write('description: $description, ')
          ..write('barcode: $barcode, ')
          ..write('itemUnit: $itemUnit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, quantity, sellingPrice, buyingPrice,
      description, barcode, itemUnit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.sellingPrice == this.sellingPrice &&
          other.buyingPrice == this.buyingPrice &&
          other.description == this.description &&
          other.barcode == this.barcode &&
          other.itemUnit == this.itemUnit);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> quantity;
  final Value<double> sellingPrice;
  final Value<double> buyingPrice;
  final Value<String?> description;
  final Value<String?> barcode;
  final Value<String?> itemUnit;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.sellingPrice = const Value.absent(),
    this.buyingPrice = const Value.absent(),
    this.description = const Value.absent(),
    this.barcode = const Value.absent(),
    this.itemUnit = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double quantity,
    required double sellingPrice,
    required double buyingPrice,
    this.description = const Value.absent(),
    this.barcode = const Value.absent(),
    this.itemUnit = const Value.absent(),
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
    Expression<String>? description,
    Expression<String>? barcode,
    Expression<String>? itemUnit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (sellingPrice != null) 'selling_price': sellingPrice,
      if (buyingPrice != null) 'buying_price': buyingPrice,
      if (description != null) 'description': description,
      if (barcode != null) 'barcode': barcode,
      if (itemUnit != null) 'item_unit': itemUnit,
    });
  }

  ItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? quantity,
      Value<double>? sellingPrice,
      Value<double>? buyingPrice,
      Value<String?>? description,
      Value<String?>? barcode,
      Value<String?>? itemUnit}) {
    return ItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      description: description ?? this.description,
      barcode: barcode ?? this.barcode,
      itemUnit: itemUnit ?? this.itemUnit,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (itemUnit.present) {
      map['item_unit'] = Variable<String>(itemUnit.value);
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
          ..write('description: $description, ')
          ..write('barcode: $barcode, ')
          ..write('itemUnit: $itemUnit')
          ..write(')'))
        .toString();
  }
}

class $SellReceiptsTable extends SellReceipts
    with TableInfo<$SellReceiptsTable, SellReceiptsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SellReceiptsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _customerIdMeta =
      const VerificationMeta('customerId');
  @override
  late final GeneratedColumn<int> customerId = GeneratedColumn<int>(
      'customer_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES customers(id) ON DELETE SET NULL');
  static const VerificationMeta _subTotalPriceMeta =
      const VerificationMeta('subTotalPrice');
  @override
  late final GeneratedColumn<double> subTotalPrice = GeneratedColumn<double>(
      'sub_total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(DiscountType.percentage.name));
  static const VerificationMeta _shippingFeeMeta =
      const VerificationMeta('shippingFee');
  @override
  late final GeneratedColumn<double> shippingFee = GeneratedColumn<double>(
      'shipping_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _taxFeeMeta = const VerificationMeta('taxFee');
  @override
  late final GeneratedColumn<double> taxFee = GeneratedColumn<double>(
      'tax_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        customerId,
        subTotalPrice,
        discount,
        discountType,
        shippingFee,
        taxFee,
        totalPrice
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sell_receipts';
  @override
  VerificationContext validateIntegrity(Insertable<SellReceiptsModel> instance,
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
    if (data.containsKey('customer_id')) {
      context.handle(
          _customerIdMeta,
          customerId.isAcceptableOrUnknown(
              data['customer_id']!, _customerIdMeta));
    }
    if (data.containsKey('sub_total_price')) {
      context.handle(
          _subTotalPriceMeta,
          subTotalPrice.isAcceptableOrUnknown(
              data['sub_total_price']!, _subTotalPriceMeta));
    } else if (isInserting) {
      context.missing(_subTotalPriceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('shipping_fee')) {
      context.handle(
          _shippingFeeMeta,
          shippingFee.isAcceptableOrUnknown(
              data['shipping_fee']!, _shippingFeeMeta));
    }
    if (data.containsKey('tax_fee')) {
      context.handle(_taxFeeMeta,
          taxFee.isAcceptableOrUnknown(data['tax_fee']!, _taxFeeMeta));
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SellReceiptsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SellReceiptsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      customerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}customer_id']),
      subTotalPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}sub_total_price'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type'])!,
      shippingFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shipping_fee'])!,
      taxFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_fee'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
    );
  }

  @override
  $SellReceiptsTable createAlias(String alias) {
    return $SellReceiptsTable(attachedDatabase, alias);
  }
}

class SellReceiptsModel extends DataClass
    implements Insertable<SellReceiptsModel> {
  final int id;
  final DateTime date;
  final int? customerId;
  final double subTotalPrice;
  final double discount;
  final String discountType;
  final double shippingFee;
  final double taxFee;
  final double totalPrice;
  const SellReceiptsModel(
      {required this.id,
      required this.date,
      this.customerId,
      required this.subTotalPrice,
      required this.discount,
      required this.discountType,
      required this.shippingFee,
      required this.taxFee,
      required this.totalPrice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || customerId != null) {
      map['customer_id'] = Variable<int>(customerId);
    }
    map['sub_total_price'] = Variable<double>(subTotalPrice);
    map['discount'] = Variable<double>(discount);
    map['discount_type'] = Variable<String>(discountType);
    map['shipping_fee'] = Variable<double>(shippingFee);
    map['tax_fee'] = Variable<double>(taxFee);
    map['total_price'] = Variable<double>(totalPrice);
    return map;
  }

  SellReceiptsCompanion toCompanion(bool nullToAbsent) {
    return SellReceiptsCompanion(
      id: Value(id),
      date: Value(date),
      customerId: customerId == null && nullToAbsent
          ? const Value.absent()
          : Value(customerId),
      subTotalPrice: Value(subTotalPrice),
      discount: Value(discount),
      discountType: Value(discountType),
      shippingFee: Value(shippingFee),
      taxFee: Value(taxFee),
      totalPrice: Value(totalPrice),
    );
  }

  factory SellReceiptsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SellReceiptsModel(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      customerId: serializer.fromJson<int?>(json['customerId']),
      subTotalPrice: serializer.fromJson<double>(json['subTotalPrice']),
      discount: serializer.fromJson<double>(json['discount']),
      discountType: serializer.fromJson<String>(json['discountType']),
      shippingFee: serializer.fromJson<double>(json['shippingFee']),
      taxFee: serializer.fromJson<double>(json['taxFee']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'customerId': serializer.toJson<int?>(customerId),
      'subTotalPrice': serializer.toJson<double>(subTotalPrice),
      'discount': serializer.toJson<double>(discount),
      'discountType': serializer.toJson<String>(discountType),
      'shippingFee': serializer.toJson<double>(shippingFee),
      'taxFee': serializer.toJson<double>(taxFee),
      'totalPrice': serializer.toJson<double>(totalPrice),
    };
  }

  SellReceiptsModel copyWith(
          {int? id,
          DateTime? date,
          Value<int?> customerId = const Value.absent(),
          double? subTotalPrice,
          double? discount,
          String? discountType,
          double? shippingFee,
          double? taxFee,
          double? totalPrice}) =>
      SellReceiptsModel(
        id: id ?? this.id,
        date: date ?? this.date,
        customerId: customerId.present ? customerId.value : this.customerId,
        subTotalPrice: subTotalPrice ?? this.subTotalPrice,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        shippingFee: shippingFee ?? this.shippingFee,
        taxFee: taxFee ?? this.taxFee,
        totalPrice: totalPrice ?? this.totalPrice,
      );
  SellReceiptsModel copyWithCompanion(SellReceiptsCompanion data) {
    return SellReceiptsModel(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      customerId:
          data.customerId.present ? data.customerId.value : this.customerId,
      subTotalPrice: data.subTotalPrice.present
          ? data.subTotalPrice.value
          : this.subTotalPrice,
      discount: data.discount.present ? data.discount.value : this.discount,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      shippingFee:
          data.shippingFee.present ? data.shippingFee.value : this.shippingFee,
      taxFee: data.taxFee.present ? data.taxFee.value : this.taxFee,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SellReceiptsModel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('customerId: $customerId, ')
          ..write('subTotalPrice: $subTotalPrice, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('taxFee: $taxFee, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, customerId, subTotalPrice, discount,
      discountType, shippingFee, taxFee, totalPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SellReceiptsModel &&
          other.id == this.id &&
          other.date == this.date &&
          other.customerId == this.customerId &&
          other.subTotalPrice == this.subTotalPrice &&
          other.discount == this.discount &&
          other.discountType == this.discountType &&
          other.shippingFee == this.shippingFee &&
          other.taxFee == this.taxFee &&
          other.totalPrice == this.totalPrice);
}

class SellReceiptsCompanion extends UpdateCompanion<SellReceiptsModel> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int?> customerId;
  final Value<double> subTotalPrice;
  final Value<double> discount;
  final Value<String> discountType;
  final Value<double> shippingFee;
  final Value<double> taxFee;
  final Value<double> totalPrice;
  const SellReceiptsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.customerId = const Value.absent(),
    this.subTotalPrice = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.taxFee = const Value.absent(),
    this.totalPrice = const Value.absent(),
  });
  SellReceiptsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.customerId = const Value.absent(),
    required double subTotalPrice,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.taxFee = const Value.absent(),
    required double totalPrice,
  })  : subTotalPrice = Value(subTotalPrice),
        totalPrice = Value(totalPrice);
  static Insertable<SellReceiptsModel> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? customerId,
    Expression<double>? subTotalPrice,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? shippingFee,
    Expression<double>? taxFee,
    Expression<double>? totalPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (customerId != null) 'customer_id': customerId,
      if (subTotalPrice != null) 'sub_total_price': subTotalPrice,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (shippingFee != null) 'shipping_fee': shippingFee,
      if (taxFee != null) 'tax_fee': taxFee,
      if (totalPrice != null) 'total_price': totalPrice,
    });
  }

  SellReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int?>? customerId,
      Value<double>? subTotalPrice,
      Value<double>? discount,
      Value<String>? discountType,
      Value<double>? shippingFee,
      Value<double>? taxFee,
      Value<double>? totalPrice}) {
    return SellReceiptsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      customerId: customerId ?? this.customerId,
      subTotalPrice: subTotalPrice ?? this.subTotalPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      shippingFee: shippingFee ?? this.shippingFee,
      taxFee: taxFee ?? this.taxFee,
      totalPrice: totalPrice ?? this.totalPrice,
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
    if (customerId.present) {
      map['customer_id'] = Variable<int>(customerId.value);
    }
    if (subTotalPrice.present) {
      map['sub_total_price'] = Variable<double>(subTotalPrice.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (shippingFee.present) {
      map['shipping_fee'] = Variable<double>(shippingFee.value);
    }
    if (taxFee.present) {
      map['tax_fee'] = Variable<double>(taxFee.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SellReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('customerId: $customerId, ')
          ..write('subTotalPrice: $subTotalPrice, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('taxFee: $taxFee, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }
}

class $SellReceiptItemsTable extends SellReceiptItems
    with TableInfo<$SellReceiptItemsTable, SellReceiptItemsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SellReceiptItemsTable(this.attachedDatabase, [this._alias]);
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
      $customConstraints:
          'NOT NULL REFERENCES sellReceipts(id) ON DELETE CASCADE');
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
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<double> costPrice = GeneratedColumn<double>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, receiptId, itemId, quantity, price, costPrice];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sell_receipt_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<SellReceiptItemsModel> instance,
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
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    } else if (isInserting) {
      context.missing(_costPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SellReceiptItemsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SellReceiptItemsModel(
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
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost_price'])!,
    );
  }

  @override
  $SellReceiptItemsTable createAlias(String alias) {
    return $SellReceiptItemsTable(attachedDatabase, alias);
  }
}

class SellReceiptItemsModel extends DataClass
    implements Insertable<SellReceiptItemsModel> {
  final int id;
  final int receiptId;
  final int itemId;
  final double quantity;
  final double price;
  final double costPrice;
  const SellReceiptItemsModel(
      {required this.id,
      required this.receiptId,
      required this.itemId,
      required this.quantity,
      required this.price,
      required this.costPrice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<int>(receiptId);
    map['item_id'] = Variable<int>(itemId);
    map['quantity'] = Variable<double>(quantity);
    map['price'] = Variable<double>(price);
    map['cost_price'] = Variable<double>(costPrice);
    return map;
  }

  SellReceiptItemsCompanion toCompanion(bool nullToAbsent) {
    return SellReceiptItemsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      itemId: Value(itemId),
      quantity: Value(quantity),
      price: Value(price),
      costPrice: Value(costPrice),
    );
  }

  factory SellReceiptItemsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SellReceiptItemsModel(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<int>(json['receiptId']),
      itemId: serializer.fromJson<int>(json['itemId']),
      quantity: serializer.fromJson<double>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
      costPrice: serializer.fromJson<double>(json['costPrice']),
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
      'costPrice': serializer.toJson<double>(costPrice),
    };
  }

  SellReceiptItemsModel copyWith(
          {int? id,
          int? receiptId,
          int? itemId,
          double? quantity,
          double? price,
          double? costPrice}) =>
      SellReceiptItemsModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        costPrice: costPrice ?? this.costPrice,
      );
  SellReceiptItemsModel copyWithCompanion(SellReceiptItemsCompanion data) {
    return SellReceiptItemsModel(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SellReceiptItemsModel(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('costPrice: $costPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, receiptId, itemId, quantity, price, costPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SellReceiptItemsModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.price == this.price &&
          other.costPrice == this.costPrice);
}

class SellReceiptItemsCompanion extends UpdateCompanion<SellReceiptItemsModel> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<int> itemId;
  final Value<double> quantity;
  final Value<double> price;
  final Value<double> costPrice;
  const SellReceiptItemsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
    this.costPrice = const Value.absent(),
  });
  SellReceiptItemsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required int itemId,
    required double quantity,
    required double price,
    required double costPrice,
  })  : receiptId = Value(receiptId),
        itemId = Value(itemId),
        quantity = Value(quantity),
        price = Value(price),
        costPrice = Value(costPrice);
  static Insertable<SellReceiptItemsModel> custom({
    Expression<int>? id,
    Expression<int>? receiptId,
    Expression<int>? itemId,
    Expression<double>? quantity,
    Expression<double>? price,
    Expression<double>? costPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (itemId != null) 'item_id': itemId,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
      if (costPrice != null) 'cost_price': costPrice,
    });
  }

  SellReceiptItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<int>? itemId,
      Value<double>? quantity,
      Value<double>? price,
      Value<double>? costPrice}) {
    return SellReceiptItemsCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      itemId: itemId ?? this.itemId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      costPrice: costPrice ?? this.costPrice,
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
    if (costPrice.present) {
      map['cost_price'] = Variable<double>(costPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SellReceiptItemsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price, ')
          ..write('costPrice: $costPrice')
          ..write(')'))
        .toString();
  }
}

class $SellPaymentsTable extends SellPayments
    with TableInfo<$SellPaymentsTable, SellPaymentsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SellPaymentsTable(this.attachedDatabase, [this._alias]);
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
      $customConstraints: 'REFERENCES sellReceipts(id) ON DELETE CASCADE');
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _debtAmountMeta =
      const VerificationMeta('debtAmount');
  @override
  late final GeneratedColumn<double> debtAmount = GeneratedColumn<double>(
      'debt_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Completed'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        receiptId,
        paymentMethod,
        paidAmount,
        debtAmount,
        paymentDate,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sell_payments';
  @override
  VerificationContext validateIntegrity(Insertable<SellPaymentsModel> instance,
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
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    if (data.containsKey('debt_amount')) {
      context.handle(
          _debtAmountMeta,
          debtAmount.isAcceptableOrUnknown(
              data['debt_amount']!, _debtAmountMeta));
    } else if (isInserting) {
      context.missing(_debtAmountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SellPaymentsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SellPaymentsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiptId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}receipt_id'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      debtAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}debt_amount'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $SellPaymentsTable createAlias(String alias) {
    return $SellPaymentsTable(attachedDatabase, alias);
  }
}

class SellPaymentsModel extends DataClass
    implements Insertable<SellPaymentsModel> {
  final int id;
  final int receiptId;
  final String paymentMethod;
  final double paidAmount;
  final double debtAmount;
  final DateTime paymentDate;
  final String status;
  const SellPaymentsModel(
      {required this.id,
      required this.receiptId,
      required this.paymentMethod,
      required this.paidAmount,
      required this.debtAmount,
      required this.paymentDate,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<int>(receiptId);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['debt_amount'] = Variable<double>(debtAmount);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['status'] = Variable<String>(status);
    return map;
  }

  SellPaymentsCompanion toCompanion(bool nullToAbsent) {
    return SellPaymentsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      paymentMethod: Value(paymentMethod),
      paidAmount: Value(paidAmount),
      debtAmount: Value(debtAmount),
      paymentDate: Value(paymentDate),
      status: Value(status),
    );
  }

  factory SellPaymentsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SellPaymentsModel(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<int>(json['receiptId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      debtAmount: serializer.fromJson<double>(json['debtAmount']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptId': serializer.toJson<int>(receiptId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'debtAmount': serializer.toJson<double>(debtAmount),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'status': serializer.toJson<String>(status),
    };
  }

  SellPaymentsModel copyWith(
          {int? id,
          int? receiptId,
          String? paymentMethod,
          double? paidAmount,
          double? debtAmount,
          DateTime? paymentDate,
          String? status}) =>
      SellPaymentsModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paidAmount: paidAmount ?? this.paidAmount,
        debtAmount: debtAmount ?? this.debtAmount,
        paymentDate: paymentDate ?? this.paymentDate,
        status: status ?? this.status,
      );
  SellPaymentsModel copyWithCompanion(SellPaymentsCompanion data) {
    return SellPaymentsModel(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      debtAmount:
          data.debtAmount.present ? data.debtAmount.value : this.debtAmount,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SellPaymentsModel(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('debtAmount: $debtAmount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, receiptId, paymentMethod, paidAmount,
      debtAmount, paymentDate, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SellPaymentsModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.paymentMethod == this.paymentMethod &&
          other.paidAmount == this.paidAmount &&
          other.debtAmount == this.debtAmount &&
          other.paymentDate == this.paymentDate &&
          other.status == this.status);
}

class SellPaymentsCompanion extends UpdateCompanion<SellPaymentsModel> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<String> paymentMethod;
  final Value<double> paidAmount;
  final Value<double> debtAmount;
  final Value<DateTime> paymentDate;
  final Value<String> status;
  const SellPaymentsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.debtAmount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.status = const Value.absent(),
  });
  SellPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required String paymentMethod,
    required double paidAmount,
    required double debtAmount,
    this.paymentDate = const Value.absent(),
    this.status = const Value.absent(),
  })  : receiptId = Value(receiptId),
        paymentMethod = Value(paymentMethod),
        paidAmount = Value(paidAmount),
        debtAmount = Value(debtAmount);
  static Insertable<SellPaymentsModel> custom({
    Expression<int>? id,
    Expression<int>? receiptId,
    Expression<String>? paymentMethod,
    Expression<double>? paidAmount,
    Expression<double>? debtAmount,
    Expression<DateTime>? paymentDate,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (debtAmount != null) 'debt_amount': debtAmount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (status != null) 'status': status,
    });
  }

  SellPaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<String>? paymentMethod,
      Value<double>? paidAmount,
      Value<double>? debtAmount,
      Value<DateTime>? paymentDate,
      Value<String>? status}) {
    return SellPaymentsCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paidAmount: paidAmount ?? this.paidAmount,
      debtAmount: debtAmount ?? this.debtAmount,
      paymentDate: paymentDate ?? this.paymentDate,
      status: status ?? this.status,
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
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (debtAmount.present) {
      map['debt_amount'] = Variable<double>(debtAmount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SellPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('debtAmount: $debtAmount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $BuyReceiptsTable extends BuyReceipts
    with TableInfo<$BuyReceiptsTable, BuyReceiptsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuyReceiptsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _supplierIdMeta =
      const VerificationMeta('supplierId');
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
      'supplier_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES suppliers(id) ON DELETE SET NULL');
  static const VerificationMeta _subTotalPriceMeta =
      const VerificationMeta('subTotalPrice');
  @override
  late final GeneratedColumn<double> subTotalPrice = GeneratedColumn<double>(
      'sub_total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(DiscountType.percentage.name));
  static const VerificationMeta _shippingFeeMeta =
      const VerificationMeta('shippingFee');
  @override
  late final GeneratedColumn<double> shippingFee = GeneratedColumn<double>(
      'shipping_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _taxFeeMeta = const VerificationMeta('taxFee');
  @override
  late final GeneratedColumn<double> taxFee = GeneratedColumn<double>(
      'tax_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        supplierId,
        subTotalPrice,
        discount,
        discountType,
        shippingFee,
        taxFee,
        totalPrice
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buy_receipts';
  @override
  VerificationContext validateIntegrity(Insertable<BuyReceiptsModel> instance,
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
    if (data.containsKey('supplier_id')) {
      context.handle(
          _supplierIdMeta,
          supplierId.isAcceptableOrUnknown(
              data['supplier_id']!, _supplierIdMeta));
    }
    if (data.containsKey('sub_total_price')) {
      context.handle(
          _subTotalPriceMeta,
          subTotalPrice.isAcceptableOrUnknown(
              data['sub_total_price']!, _subTotalPriceMeta));
    } else if (isInserting) {
      context.missing(_subTotalPriceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('shipping_fee')) {
      context.handle(
          _shippingFeeMeta,
          shippingFee.isAcceptableOrUnknown(
              data['shipping_fee']!, _shippingFeeMeta));
    }
    if (data.containsKey('tax_fee')) {
      context.handle(_taxFeeMeta,
          taxFee.isAcceptableOrUnknown(data['tax_fee']!, _taxFeeMeta));
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BuyReceiptsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuyReceiptsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      supplierId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}supplier_id']),
      subTotalPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}sub_total_price'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type'])!,
      shippingFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shipping_fee'])!,
      taxFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_fee'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
    );
  }

  @override
  $BuyReceiptsTable createAlias(String alias) {
    return $BuyReceiptsTable(attachedDatabase, alias);
  }
}

class BuyReceiptsModel extends DataClass
    implements Insertable<BuyReceiptsModel> {
  final int id;
  final DateTime date;
  final int? supplierId;
  final double subTotalPrice;
  final double discount;
  final String discountType;
  final double shippingFee;
  final double taxFee;
  final double totalPrice;
  const BuyReceiptsModel(
      {required this.id,
      required this.date,
      this.supplierId,
      required this.subTotalPrice,
      required this.discount,
      required this.discountType,
      required this.shippingFee,
      required this.taxFee,
      required this.totalPrice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<int>(supplierId);
    }
    map['sub_total_price'] = Variable<double>(subTotalPrice);
    map['discount'] = Variable<double>(discount);
    map['discount_type'] = Variable<String>(discountType);
    map['shipping_fee'] = Variable<double>(shippingFee);
    map['tax_fee'] = Variable<double>(taxFee);
    map['total_price'] = Variable<double>(totalPrice);
    return map;
  }

  BuyReceiptsCompanion toCompanion(bool nullToAbsent) {
    return BuyReceiptsCompanion(
      id: Value(id),
      date: Value(date),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      subTotalPrice: Value(subTotalPrice),
      discount: Value(discount),
      discountType: Value(discountType),
      shippingFee: Value(shippingFee),
      taxFee: Value(taxFee),
      totalPrice: Value(totalPrice),
    );
  }

  factory BuyReceiptsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyReceiptsModel(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      supplierId: serializer.fromJson<int?>(json['supplierId']),
      subTotalPrice: serializer.fromJson<double>(json['subTotalPrice']),
      discount: serializer.fromJson<double>(json['discount']),
      discountType: serializer.fromJson<String>(json['discountType']),
      shippingFee: serializer.fromJson<double>(json['shippingFee']),
      taxFee: serializer.fromJson<double>(json['taxFee']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'supplierId': serializer.toJson<int?>(supplierId),
      'subTotalPrice': serializer.toJson<double>(subTotalPrice),
      'discount': serializer.toJson<double>(discount),
      'discountType': serializer.toJson<String>(discountType),
      'shippingFee': serializer.toJson<double>(shippingFee),
      'taxFee': serializer.toJson<double>(taxFee),
      'totalPrice': serializer.toJson<double>(totalPrice),
    };
  }

  BuyReceiptsModel copyWith(
          {int? id,
          DateTime? date,
          Value<int?> supplierId = const Value.absent(),
          double? subTotalPrice,
          double? discount,
          String? discountType,
          double? shippingFee,
          double? taxFee,
          double? totalPrice}) =>
      BuyReceiptsModel(
        id: id ?? this.id,
        date: date ?? this.date,
        supplierId: supplierId.present ? supplierId.value : this.supplierId,
        subTotalPrice: subTotalPrice ?? this.subTotalPrice,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        shippingFee: shippingFee ?? this.shippingFee,
        taxFee: taxFee ?? this.taxFee,
        totalPrice: totalPrice ?? this.totalPrice,
      );
  BuyReceiptsModel copyWithCompanion(BuyReceiptsCompanion data) {
    return BuyReceiptsModel(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      supplierId:
          data.supplierId.present ? data.supplierId.value : this.supplierId,
      subTotalPrice: data.subTotalPrice.present
          ? data.subTotalPrice.value
          : this.subTotalPrice,
      discount: data.discount.present ? data.discount.value : this.discount,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      shippingFee:
          data.shippingFee.present ? data.shippingFee.value : this.shippingFee,
      taxFee: data.taxFee.present ? data.taxFee.value : this.taxFee,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuyReceiptsModel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('supplierId: $supplierId, ')
          ..write('subTotalPrice: $subTotalPrice, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('taxFee: $taxFee, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, supplierId, subTotalPrice, discount,
      discountType, shippingFee, taxFee, totalPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuyReceiptsModel &&
          other.id == this.id &&
          other.date == this.date &&
          other.supplierId == this.supplierId &&
          other.subTotalPrice == this.subTotalPrice &&
          other.discount == this.discount &&
          other.discountType == this.discountType &&
          other.shippingFee == this.shippingFee &&
          other.taxFee == this.taxFee &&
          other.totalPrice == this.totalPrice);
}

class BuyReceiptsCompanion extends UpdateCompanion<BuyReceiptsModel> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int?> supplierId;
  final Value<double> subTotalPrice;
  final Value<double> discount;
  final Value<String> discountType;
  final Value<double> shippingFee;
  final Value<double> taxFee;
  final Value<double> totalPrice;
  const BuyReceiptsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.subTotalPrice = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.taxFee = const Value.absent(),
    this.totalPrice = const Value.absent(),
  });
  BuyReceiptsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.supplierId = const Value.absent(),
    required double subTotalPrice,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.taxFee = const Value.absent(),
    required double totalPrice,
  })  : subTotalPrice = Value(subTotalPrice),
        totalPrice = Value(totalPrice);
  static Insertable<BuyReceiptsModel> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? supplierId,
    Expression<double>? subTotalPrice,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? shippingFee,
    Expression<double>? taxFee,
    Expression<double>? totalPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (supplierId != null) 'supplier_id': supplierId,
      if (subTotalPrice != null) 'sub_total_price': subTotalPrice,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (shippingFee != null) 'shipping_fee': shippingFee,
      if (taxFee != null) 'tax_fee': taxFee,
      if (totalPrice != null) 'total_price': totalPrice,
    });
  }

  BuyReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int?>? supplierId,
      Value<double>? subTotalPrice,
      Value<double>? discount,
      Value<String>? discountType,
      Value<double>? shippingFee,
      Value<double>? taxFee,
      Value<double>? totalPrice}) {
    return BuyReceiptsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      supplierId: supplierId ?? this.supplierId,
      subTotalPrice: subTotalPrice ?? this.subTotalPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      shippingFee: shippingFee ?? this.shippingFee,
      taxFee: taxFee ?? this.taxFee,
      totalPrice: totalPrice ?? this.totalPrice,
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
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (subTotalPrice.present) {
      map['sub_total_price'] = Variable<double>(subTotalPrice.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (shippingFee.present) {
      map['shipping_fee'] = Variable<double>(shippingFee.value);
    }
    if (taxFee.present) {
      map['tax_fee'] = Variable<double>(taxFee.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('supplierId: $supplierId, ')
          ..write('subTotalPrice: $subTotalPrice, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('taxFee: $taxFee, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }
}

class $BuyReceiptItemsTable extends BuyReceiptItems
    with TableInfo<$BuyReceiptItemsTable, BuyReceiptItemsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuyReceiptItemsTable(this.attachedDatabase, [this._alias]);
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
      $customConstraints:
          'NOT NULL REFERENCES buyReceipts(id) ON DELETE CASCADE');
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
  static const String $name = 'buy_receipt_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<BuyReceiptItemsModel> instance,
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
  BuyReceiptItemsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuyReceiptItemsModel(
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
  $BuyReceiptItemsTable createAlias(String alias) {
    return $BuyReceiptItemsTable(attachedDatabase, alias);
  }
}

class BuyReceiptItemsModel extends DataClass
    implements Insertable<BuyReceiptItemsModel> {
  final int id;
  final int receiptId;
  final int itemId;
  final double quantity;
  final double price;
  const BuyReceiptItemsModel(
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

  BuyReceiptItemsCompanion toCompanion(bool nullToAbsent) {
    return BuyReceiptItemsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      itemId: Value(itemId),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory BuyReceiptItemsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyReceiptItemsModel(
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

  BuyReceiptItemsModel copyWith(
          {int? id,
          int? receiptId,
          int? itemId,
          double? quantity,
          double? price}) =>
      BuyReceiptItemsModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  BuyReceiptItemsModel copyWithCompanion(BuyReceiptItemsCompanion data) {
    return BuyReceiptItemsModel(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuyReceiptItemsModel(')
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
      (other is BuyReceiptItemsModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class BuyReceiptItemsCompanion extends UpdateCompanion<BuyReceiptItemsModel> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<int> itemId;
  final Value<double> quantity;
  final Value<double> price;
  const BuyReceiptItemsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  BuyReceiptItemsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required int itemId,
    required double quantity,
    required double price,
  })  : receiptId = Value(receiptId),
        itemId = Value(itemId),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<BuyReceiptItemsModel> custom({
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

  BuyReceiptItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<int>? itemId,
      Value<double>? quantity,
      Value<double>? price}) {
    return BuyReceiptItemsCompanion(
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
    return (StringBuffer('BuyReceiptItemsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $BuyPaymentsTable extends BuyPayments
    with TableInfo<$BuyPaymentsTable, BuyPaymentsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuyPaymentsTable(this.attachedDatabase, [this._alias]);
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
      $customConstraints: 'REFERENCES buyReceipts(id) ON DELETE CASCADE');
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _debtAmountMeta =
      const VerificationMeta('debtAmount');
  @override
  late final GeneratedColumn<double> debtAmount = GeneratedColumn<double>(
      'debt_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Completed'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        receiptId,
        paymentMethod,
        paidAmount,
        debtAmount,
        paymentDate,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buy_payments';
  @override
  VerificationContext validateIntegrity(Insertable<BuyPaymentsModel> instance,
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
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    if (data.containsKey('debt_amount')) {
      context.handle(
          _debtAmountMeta,
          debtAmount.isAcceptableOrUnknown(
              data['debt_amount']!, _debtAmountMeta));
    } else if (isInserting) {
      context.missing(_debtAmountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BuyPaymentsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuyPaymentsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiptId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}receipt_id'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      debtAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}debt_amount'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $BuyPaymentsTable createAlias(String alias) {
    return $BuyPaymentsTable(attachedDatabase, alias);
  }
}

class BuyPaymentsModel extends DataClass
    implements Insertable<BuyPaymentsModel> {
  final int id;
  final int receiptId;
  final String paymentMethod;
  final double paidAmount;
  final double debtAmount;
  final DateTime paymentDate;
  final String status;
  const BuyPaymentsModel(
      {required this.id,
      required this.receiptId,
      required this.paymentMethod,
      required this.paidAmount,
      required this.debtAmount,
      required this.paymentDate,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<int>(receiptId);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['debt_amount'] = Variable<double>(debtAmount);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['status'] = Variable<String>(status);
    return map;
  }

  BuyPaymentsCompanion toCompanion(bool nullToAbsent) {
    return BuyPaymentsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      paymentMethod: Value(paymentMethod),
      paidAmount: Value(paidAmount),
      debtAmount: Value(debtAmount),
      paymentDate: Value(paymentDate),
      status: Value(status),
    );
  }

  factory BuyPaymentsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyPaymentsModel(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<int>(json['receiptId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      debtAmount: serializer.fromJson<double>(json['debtAmount']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptId': serializer.toJson<int>(receiptId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'debtAmount': serializer.toJson<double>(debtAmount),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'status': serializer.toJson<String>(status),
    };
  }

  BuyPaymentsModel copyWith(
          {int? id,
          int? receiptId,
          String? paymentMethod,
          double? paidAmount,
          double? debtAmount,
          DateTime? paymentDate,
          String? status}) =>
      BuyPaymentsModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paidAmount: paidAmount ?? this.paidAmount,
        debtAmount: debtAmount ?? this.debtAmount,
        paymentDate: paymentDate ?? this.paymentDate,
        status: status ?? this.status,
      );
  BuyPaymentsModel copyWithCompanion(BuyPaymentsCompanion data) {
    return BuyPaymentsModel(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      debtAmount:
          data.debtAmount.present ? data.debtAmount.value : this.debtAmount,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BuyPaymentsModel(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('debtAmount: $debtAmount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, receiptId, paymentMethod, paidAmount,
      debtAmount, paymentDate, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuyPaymentsModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.paymentMethod == this.paymentMethod &&
          other.paidAmount == this.paidAmount &&
          other.debtAmount == this.debtAmount &&
          other.paymentDate == this.paymentDate &&
          other.status == this.status);
}

class BuyPaymentsCompanion extends UpdateCompanion<BuyPaymentsModel> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<String> paymentMethod;
  final Value<double> paidAmount;
  final Value<double> debtAmount;
  final Value<DateTime> paymentDate;
  final Value<String> status;
  const BuyPaymentsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.debtAmount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.status = const Value.absent(),
  });
  BuyPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required String paymentMethod,
    required double paidAmount,
    required double debtAmount,
    this.paymentDate = const Value.absent(),
    this.status = const Value.absent(),
  })  : receiptId = Value(receiptId),
        paymentMethod = Value(paymentMethod),
        paidAmount = Value(paidAmount),
        debtAmount = Value(debtAmount);
  static Insertable<BuyPaymentsModel> custom({
    Expression<int>? id,
    Expression<int>? receiptId,
    Expression<String>? paymentMethod,
    Expression<double>? paidAmount,
    Expression<double>? debtAmount,
    Expression<DateTime>? paymentDate,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (debtAmount != null) 'debt_amount': debtAmount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (status != null) 'status': status,
    });
  }

  BuyPaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<String>? paymentMethod,
      Value<double>? paidAmount,
      Value<double>? debtAmount,
      Value<DateTime>? paymentDate,
      Value<String>? status}) {
    return BuyPaymentsCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paidAmount: paidAmount ?? this.paidAmount,
      debtAmount: debtAmount ?? this.debtAmount,
      paymentDate: paymentDate ?? this.paymentDate,
      status: status ?? this.status,
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
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (debtAmount.present) {
      map['debt_amount'] = Variable<double>(debtAmount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('debtAmount: $debtAmount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $ReturnReceiptsTable extends ReturnReceipts
    with TableInfo<$ReturnReceiptsTable, ReturnReceiptsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnReceiptsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _subTotalPriceMeta =
      const VerificationMeta('subTotalPrice');
  @override
  late final GeneratedColumn<double> subTotalPrice = GeneratedColumn<double>(
      'sub_total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(DiscountType.percentage.name));
  static const VerificationMeta _shippingFeeMeta =
      const VerificationMeta('shippingFee');
  @override
  late final GeneratedColumn<double> shippingFee = GeneratedColumn<double>(
      'shipping_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _taxFeeMeta = const VerificationMeta('taxFee');
  @override
  late final GeneratedColumn<double> taxFee = GeneratedColumn<double>(
      'tax_fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        subTotalPrice,
        discount,
        discountType,
        shippingFee,
        taxFee,
        totalPrice
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'return_receipts';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReturnReceiptsModel> instance,
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
    if (data.containsKey('sub_total_price')) {
      context.handle(
          _subTotalPriceMeta,
          subTotalPrice.isAcceptableOrUnknown(
              data['sub_total_price']!, _subTotalPriceMeta));
    } else if (isInserting) {
      context.missing(_subTotalPriceMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('shipping_fee')) {
      context.handle(
          _shippingFeeMeta,
          shippingFee.isAcceptableOrUnknown(
              data['shipping_fee']!, _shippingFeeMeta));
    }
    if (data.containsKey('tax_fee')) {
      context.handle(_taxFeeMeta,
          taxFee.isAcceptableOrUnknown(data['tax_fee']!, _taxFeeMeta));
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReturnReceiptsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnReceiptsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      subTotalPrice: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}sub_total_price'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type'])!,
      shippingFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}shipping_fee'])!,
      taxFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_fee'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
    );
  }

  @override
  $ReturnReceiptsTable createAlias(String alias) {
    return $ReturnReceiptsTable(attachedDatabase, alias);
  }
}

class ReturnReceiptsModel extends DataClass
    implements Insertable<ReturnReceiptsModel> {
  final int id;
  final DateTime date;
  final double subTotalPrice;
  final double discount;
  final String discountType;
  final double shippingFee;
  final double taxFee;
  final double totalPrice;
  const ReturnReceiptsModel(
      {required this.id,
      required this.date,
      required this.subTotalPrice,
      required this.discount,
      required this.discountType,
      required this.shippingFee,
      required this.taxFee,
      required this.totalPrice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['sub_total_price'] = Variable<double>(subTotalPrice);
    map['discount'] = Variable<double>(discount);
    map['discount_type'] = Variable<String>(discountType);
    map['shipping_fee'] = Variable<double>(shippingFee);
    map['tax_fee'] = Variable<double>(taxFee);
    map['total_price'] = Variable<double>(totalPrice);
    return map;
  }

  ReturnReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReturnReceiptsCompanion(
      id: Value(id),
      date: Value(date),
      subTotalPrice: Value(subTotalPrice),
      discount: Value(discount),
      discountType: Value(discountType),
      shippingFee: Value(shippingFee),
      taxFee: Value(taxFee),
      totalPrice: Value(totalPrice),
    );
  }

  factory ReturnReceiptsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnReceiptsModel(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      subTotalPrice: serializer.fromJson<double>(json['subTotalPrice']),
      discount: serializer.fromJson<double>(json['discount']),
      discountType: serializer.fromJson<String>(json['discountType']),
      shippingFee: serializer.fromJson<double>(json['shippingFee']),
      taxFee: serializer.fromJson<double>(json['taxFee']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'subTotalPrice': serializer.toJson<double>(subTotalPrice),
      'discount': serializer.toJson<double>(discount),
      'discountType': serializer.toJson<String>(discountType),
      'shippingFee': serializer.toJson<double>(shippingFee),
      'taxFee': serializer.toJson<double>(taxFee),
      'totalPrice': serializer.toJson<double>(totalPrice),
    };
  }

  ReturnReceiptsModel copyWith(
          {int? id,
          DateTime? date,
          double? subTotalPrice,
          double? discount,
          String? discountType,
          double? shippingFee,
          double? taxFee,
          double? totalPrice}) =>
      ReturnReceiptsModel(
        id: id ?? this.id,
        date: date ?? this.date,
        subTotalPrice: subTotalPrice ?? this.subTotalPrice,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        shippingFee: shippingFee ?? this.shippingFee,
        taxFee: taxFee ?? this.taxFee,
        totalPrice: totalPrice ?? this.totalPrice,
      );
  ReturnReceiptsModel copyWithCompanion(ReturnReceiptsCompanion data) {
    return ReturnReceiptsModel(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      subTotalPrice: data.subTotalPrice.present
          ? data.subTotalPrice.value
          : this.subTotalPrice,
      discount: data.discount.present ? data.discount.value : this.discount,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      shippingFee:
          data.shippingFee.present ? data.shippingFee.value : this.shippingFee,
      taxFee: data.taxFee.present ? data.taxFee.value : this.taxFee,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnReceiptsModel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('subTotalPrice: $subTotalPrice, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('taxFee: $taxFee, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, subTotalPrice, discount,
      discountType, shippingFee, taxFee, totalPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReturnReceiptsModel &&
          other.id == this.id &&
          other.date == this.date &&
          other.subTotalPrice == this.subTotalPrice &&
          other.discount == this.discount &&
          other.discountType == this.discountType &&
          other.shippingFee == this.shippingFee &&
          other.taxFee == this.taxFee &&
          other.totalPrice == this.totalPrice);
}

class ReturnReceiptsCompanion extends UpdateCompanion<ReturnReceiptsModel> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<double> subTotalPrice;
  final Value<double> discount;
  final Value<String> discountType;
  final Value<double> shippingFee;
  final Value<double> taxFee;
  final Value<double> totalPrice;
  const ReturnReceiptsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.subTotalPrice = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.taxFee = const Value.absent(),
    this.totalPrice = const Value.absent(),
  });
  ReturnReceiptsCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required double subTotalPrice,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.shippingFee = const Value.absent(),
    this.taxFee = const Value.absent(),
    required double totalPrice,
  })  : subTotalPrice = Value(subTotalPrice),
        totalPrice = Value(totalPrice);
  static Insertable<ReturnReceiptsModel> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<double>? subTotalPrice,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<double>? shippingFee,
    Expression<double>? taxFee,
    Expression<double>? totalPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (subTotalPrice != null) 'sub_total_price': subTotalPrice,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (shippingFee != null) 'shipping_fee': shippingFee,
      if (taxFee != null) 'tax_fee': taxFee,
      if (totalPrice != null) 'total_price': totalPrice,
    });
  }

  ReturnReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<double>? subTotalPrice,
      Value<double>? discount,
      Value<String>? discountType,
      Value<double>? shippingFee,
      Value<double>? taxFee,
      Value<double>? totalPrice}) {
    return ReturnReceiptsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      subTotalPrice: subTotalPrice ?? this.subTotalPrice,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      shippingFee: shippingFee ?? this.shippingFee,
      taxFee: taxFee ?? this.taxFee,
      totalPrice: totalPrice ?? this.totalPrice,
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
    if (subTotalPrice.present) {
      map['sub_total_price'] = Variable<double>(subTotalPrice.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (shippingFee.present) {
      map['shipping_fee'] = Variable<double>(shippingFee.value);
    }
    if (taxFee.present) {
      map['tax_fee'] = Variable<double>(taxFee.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReturnReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('subTotalPrice: $subTotalPrice, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('shippingFee: $shippingFee, ')
          ..write('taxFee: $taxFee, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }
}

class $ReturnReceiptItemsTable extends ReturnReceiptItems
    with TableInfo<$ReturnReceiptItemsTable, ReturnReceiptItemsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnReceiptItemsTable(this.attachedDatabase, [this._alias]);
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
      $customConstraints:
          'NOT NULL REFERENCES returnReceipts(id) ON DELETE CASCADE');
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
  static const String $name = 'return_receipt_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReturnReceiptItemsModel> instance,
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
  ReturnReceiptItemsModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnReceiptItemsModel(
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
  $ReturnReceiptItemsTable createAlias(String alias) {
    return $ReturnReceiptItemsTable(attachedDatabase, alias);
  }
}

class ReturnReceiptItemsModel extends DataClass
    implements Insertable<ReturnReceiptItemsModel> {
  final int id;
  final int receiptId;
  final int itemId;
  final double quantity;
  final double price;
  const ReturnReceiptItemsModel(
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

  ReturnReceiptItemsCompanion toCompanion(bool nullToAbsent) {
    return ReturnReceiptItemsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      itemId: Value(itemId),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory ReturnReceiptItemsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnReceiptItemsModel(
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

  ReturnReceiptItemsModel copyWith(
          {int? id,
          int? receiptId,
          int? itemId,
          double? quantity,
          double? price}) =>
      ReturnReceiptItemsModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  ReturnReceiptItemsModel copyWithCompanion(ReturnReceiptItemsCompanion data) {
    return ReturnReceiptItemsModel(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnReceiptItemsModel(')
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
      (other is ReturnReceiptItemsModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.itemId == this.itemId &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class ReturnReceiptItemsCompanion
    extends UpdateCompanion<ReturnReceiptItemsModel> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<int> itemId;
  final Value<double> quantity;
  final Value<double> price;
  const ReturnReceiptItemsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  ReturnReceiptItemsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required int itemId,
    required double quantity,
    required double price,
  })  : receiptId = Value(receiptId),
        itemId = Value(itemId),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<ReturnReceiptItemsModel> custom({
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

  ReturnReceiptItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<int>? itemId,
      Value<double>? quantity,
      Value<double>? price}) {
    return ReturnReceiptItemsCompanion(
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
    return (StringBuffer('ReturnReceiptItemsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('itemId: $itemId, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ReturnPaymentsTable extends ReturnPayments
    with TableInfo<$ReturnPaymentsTable, ReturnPaymentsModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReturnPaymentsTable(this.attachedDatabase, [this._alias]);
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
      $customConstraints: 'REFERENCES returnReceipts(id) ON DELETE CASCADE');
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _debtAmountMeta =
      const VerificationMeta('debtAmount');
  @override
  late final GeneratedColumn<double> debtAmount = GeneratedColumn<double>(
      'debt_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Completed'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        receiptId,
        paymentMethod,
        paidAmount,
        debtAmount,
        paymentDate,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'return_payments';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReturnPaymentsModel> instance,
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
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    } else if (isInserting) {
      context.missing(_paidAmountMeta);
    }
    if (data.containsKey('debt_amount')) {
      context.handle(
          _debtAmountMeta,
          debtAmount.isAcceptableOrUnknown(
              data['debt_amount']!, _debtAmountMeta));
    } else if (isInserting) {
      context.missing(_debtAmountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReturnPaymentsModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReturnPaymentsModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiptId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}receipt_id'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount'])!,
      debtAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}debt_amount'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $ReturnPaymentsTable createAlias(String alias) {
    return $ReturnPaymentsTable(attachedDatabase, alias);
  }
}

class ReturnPaymentsModel extends DataClass
    implements Insertable<ReturnPaymentsModel> {
  final int id;
  final int receiptId;
  final String paymentMethod;
  final double paidAmount;
  final double debtAmount;
  final DateTime paymentDate;
  final String status;
  const ReturnPaymentsModel(
      {required this.id,
      required this.receiptId,
      required this.paymentMethod,
      required this.paidAmount,
      required this.debtAmount,
      required this.paymentDate,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<int>(receiptId);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['debt_amount'] = Variable<double>(debtAmount);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['status'] = Variable<String>(status);
    return map;
  }

  ReturnPaymentsCompanion toCompanion(bool nullToAbsent) {
    return ReturnPaymentsCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      paymentMethod: Value(paymentMethod),
      paidAmount: Value(paidAmount),
      debtAmount: Value(debtAmount),
      paymentDate: Value(paymentDate),
      status: Value(status),
    );
  }

  factory ReturnPaymentsModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReturnPaymentsModel(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<int>(json['receiptId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      debtAmount: serializer.fromJson<double>(json['debtAmount']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptId': serializer.toJson<int>(receiptId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'debtAmount': serializer.toJson<double>(debtAmount),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'status': serializer.toJson<String>(status),
    };
  }

  ReturnPaymentsModel copyWith(
          {int? id,
          int? receiptId,
          String? paymentMethod,
          double? paidAmount,
          double? debtAmount,
          DateTime? paymentDate,
          String? status}) =>
      ReturnPaymentsModel(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paidAmount: paidAmount ?? this.paidAmount,
        debtAmount: debtAmount ?? this.debtAmount,
        paymentDate: paymentDate ?? this.paymentDate,
        status: status ?? this.status,
      );
  ReturnPaymentsModel copyWithCompanion(ReturnPaymentsCompanion data) {
    return ReturnPaymentsModel(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      debtAmount:
          data.debtAmount.present ? data.debtAmount.value : this.debtAmount,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReturnPaymentsModel(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('debtAmount: $debtAmount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, receiptId, paymentMethod, paidAmount,
      debtAmount, paymentDate, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReturnPaymentsModel &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.paymentMethod == this.paymentMethod &&
          other.paidAmount == this.paidAmount &&
          other.debtAmount == this.debtAmount &&
          other.paymentDate == this.paymentDate &&
          other.status == this.status);
}

class ReturnPaymentsCompanion extends UpdateCompanion<ReturnPaymentsModel> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<String> paymentMethod;
  final Value<double> paidAmount;
  final Value<double> debtAmount;
  final Value<DateTime> paymentDate;
  final Value<String> status;
  const ReturnPaymentsCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.debtAmount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.status = const Value.absent(),
  });
  ReturnPaymentsCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required String paymentMethod,
    required double paidAmount,
    required double debtAmount,
    this.paymentDate = const Value.absent(),
    this.status = const Value.absent(),
  })  : receiptId = Value(receiptId),
        paymentMethod = Value(paymentMethod),
        paidAmount = Value(paidAmount),
        debtAmount = Value(debtAmount);
  static Insertable<ReturnPaymentsModel> custom({
    Expression<int>? id,
    Expression<int>? receiptId,
    Expression<String>? paymentMethod,
    Expression<double>? paidAmount,
    Expression<double>? debtAmount,
    Expression<DateTime>? paymentDate,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (debtAmount != null) 'debt_amount': debtAmount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (status != null) 'status': status,
    });
  }

  ReturnPaymentsCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<String>? paymentMethod,
      Value<double>? paidAmount,
      Value<double>? debtAmount,
      Value<DateTime>? paymentDate,
      Value<String>? status}) {
    return ReturnPaymentsCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paidAmount: paidAmount ?? this.paidAmount,
      debtAmount: debtAmount ?? this.debtAmount,
      paymentDate: paymentDate ?? this.paymentDate,
      status: status ?? this.status,
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
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (debtAmount.present) {
      map['debt_amount'] = Variable<double>(debtAmount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReturnPaymentsCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('debtAmount: $debtAmount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _extraPhoneNumberMeta =
      const VerificationMeta('extraPhoneNumber');
  @override
  late final GeneratedColumn<String> extraPhoneNumber = GeneratedColumn<String>(
      'extra_phone_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phoneNumber, street, extraPhoneNumber, city, state, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<CustomerData> instance,
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
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    }
    if (data.containsKey('extra_phone_number')) {
      context.handle(
          _extraPhoneNumberMeta,
          extraPhoneNumber.isAcceptableOrUnknown(
              data['extra_phone_number']!, _extraPhoneNumberMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street']),
      extraPhoneNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_phone_number']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final int id;
  final String name;
  final String? phoneNumber;
  final String? street;
  final String? extraPhoneNumber;
  final String? city;
  final String? state;
  final String? country;
  const CustomerData(
      {required this.id,
      required this.name,
      this.phoneNumber,
      this.street,
      this.extraPhoneNumber,
      this.city,
      this.state,
      this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || extraPhoneNumber != null) {
      map['extra_phone_number'] = Variable<String>(extraPhoneNumber);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      street:
          street == null && nullToAbsent ? const Value.absent() : Value(street),
      extraPhoneNumber: extraPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(extraPhoneNumber),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
    );
  }

  factory CustomerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      street: serializer.fromJson<String?>(json['street']),
      extraPhoneNumber: serializer.fromJson<String?>(json['extraPhoneNumber']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      country: serializer.fromJson<String?>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'street': serializer.toJson<String?>(street),
      'extraPhoneNumber': serializer.toJson<String?>(extraPhoneNumber),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'country': serializer.toJson<String?>(country),
    };
  }

  CustomerData copyWith(
          {int? id,
          String? name,
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> street = const Value.absent(),
          Value<String?> extraPhoneNumber = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<String?> country = const Value.absent()}) =>
      CustomerData(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        street: street.present ? street.value : this.street,
        extraPhoneNumber: extraPhoneNumber.present
            ? extraPhoneNumber.value
            : this.extraPhoneNumber,
        city: city.present ? city.value : this.city,
        state: state.present ? state.value : this.state,
        country: country.present ? country.value : this.country,
      );
  CustomerData copyWithCompanion(CustomersCompanion data) {
    return CustomerData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      street: data.street.present ? data.street.value : this.street,
      extraPhoneNumber: data.extraPhoneNumber.present
          ? data.extraPhoneNumber.value
          : this.extraPhoneNumber,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      country: data.country.present ? data.country.value : this.country,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('street: $street, ')
          ..write('extraPhoneNumber: $extraPhoneNumber, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, phoneNumber, street, extraPhoneNumber, city, state, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.street == this.street &&
          other.extraPhoneNumber == this.extraPhoneNumber &&
          other.city == this.city &&
          other.state == this.state &&
          other.country == this.country);
}

class CustomersCompanion extends UpdateCompanion<CustomerData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phoneNumber;
  final Value<String?> street;
  final Value<String?> extraPhoneNumber;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> country;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.street = const Value.absent(),
    this.extraPhoneNumber = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phoneNumber = const Value.absent(),
    this.street = const Value.absent(),
    this.extraPhoneNumber = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CustomerData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? street,
    Expression<String>? extraPhoneNumber,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? country,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (street != null) 'street': street,
      if (extraPhoneNumber != null) 'extra_phone_number': extraPhoneNumber,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
    });
  }

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phoneNumber,
      Value<String?>? street,
      Value<String?>? extraPhoneNumber,
      Value<String?>? city,
      Value<String?>? state,
      Value<String?>? country}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      extraPhoneNumber: extraPhoneNumber ?? this.extraPhoneNumber,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
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
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (extraPhoneNumber.present) {
      map['extra_phone_number'] = Variable<String>(extraPhoneNumber.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('street: $street, ')
          ..write('extraPhoneNumber: $extraPhoneNumber, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, SupplierData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _extraPhoneNumberMeta =
      const VerificationMeta('extraPhoneNumber');
  @override
  late final GeneratedColumn<String> extraPhoneNumber = GeneratedColumn<String>(
      'extra_phone_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phoneNumber, street, extraPhoneNumber, city, state, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(Insertable<SupplierData> instance,
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
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    }
    if (data.containsKey('extra_phone_number')) {
      context.handle(
          _extraPhoneNumberMeta,
          extraPhoneNumber.isAcceptableOrUnknown(
              data['extra_phone_number']!, _extraPhoneNumberMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street']),
      extraPhoneNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extra_phone_number']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class SupplierData extends DataClass implements Insertable<SupplierData> {
  final int id;
  final String name;
  final String? phoneNumber;
  final String? street;
  final String? extraPhoneNumber;
  final String? city;
  final String? state;
  final String? country;
  const SupplierData(
      {required this.id,
      required this.name,
      this.phoneNumber,
      this.street,
      this.extraPhoneNumber,
      this.city,
      this.state,
      this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || extraPhoneNumber != null) {
      map['extra_phone_number'] = Variable<String>(extraPhoneNumber);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      name: Value(name),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      street:
          street == null && nullToAbsent ? const Value.absent() : Value(street),
      extraPhoneNumber: extraPhoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(extraPhoneNumber),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
    );
  }

  factory SupplierData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      street: serializer.fromJson<String?>(json['street']),
      extraPhoneNumber: serializer.fromJson<String?>(json['extraPhoneNumber']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      country: serializer.fromJson<String?>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'street': serializer.toJson<String?>(street),
      'extraPhoneNumber': serializer.toJson<String?>(extraPhoneNumber),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'country': serializer.toJson<String?>(country),
    };
  }

  SupplierData copyWith(
          {int? id,
          String? name,
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> street = const Value.absent(),
          Value<String?> extraPhoneNumber = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<String?> country = const Value.absent()}) =>
      SupplierData(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        street: street.present ? street.value : this.street,
        extraPhoneNumber: extraPhoneNumber.present
            ? extraPhoneNumber.value
            : this.extraPhoneNumber,
        city: city.present ? city.value : this.city,
        state: state.present ? state.value : this.state,
        country: country.present ? country.value : this.country,
      );
  SupplierData copyWithCompanion(SuppliersCompanion data) {
    return SupplierData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      street: data.street.present ? data.street.value : this.street,
      extraPhoneNumber: data.extraPhoneNumber.present
          ? data.extraPhoneNumber.value
          : this.extraPhoneNumber,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      country: data.country.present ? data.country.value : this.country,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('street: $street, ')
          ..write('extraPhoneNumber: $extraPhoneNumber, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, phoneNumber, street, extraPhoneNumber, city, state, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phoneNumber == this.phoneNumber &&
          other.street == this.street &&
          other.extraPhoneNumber == this.extraPhoneNumber &&
          other.city == this.city &&
          other.state == this.state &&
          other.country == this.country);
}

class SuppliersCompanion extends UpdateCompanion<SupplierData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phoneNumber;
  final Value<String?> street;
  final Value<String?> extraPhoneNumber;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> country;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.street = const Value.absent(),
    this.extraPhoneNumber = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phoneNumber = const Value.absent(),
    this.street = const Value.absent(),
    this.extraPhoneNumber = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.country = const Value.absent(),
  }) : name = Value(name);
  static Insertable<SupplierData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phoneNumber,
    Expression<String>? street,
    Expression<String>? extraPhoneNumber,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? country,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (street != null) 'street': street,
      if (extraPhoneNumber != null) 'extra_phone_number': extraPhoneNumber,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (country != null) 'country': country,
    });
  }

  SuppliersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phoneNumber,
      Value<String?>? street,
      Value<String?>? extraPhoneNumber,
      Value<String?>? city,
      Value<String?>? state,
      Value<String?>? country}) {
    return SuppliersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      street: street ?? this.street,
      extraPhoneNumber: extraPhoneNumber ?? this.extraPhoneNumber,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
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
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (extraPhoneNumber.present) {
      map['extra_phone_number'] = Variable<String>(extraPhoneNumber.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('street: $street, ')
          ..write('extraPhoneNumber: $extraPhoneNumber, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }
}

class $VaultTable extends Vault with TableInfo<$VaultTable, VaultModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaultTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountOnHandMeta =
      const VerificationMeta('amountOnHand');
  @override
  late final GeneratedColumn<double> amountOnHand = GeneratedColumn<double>(
      'amount_on_hand', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.00));
  @override
  List<GeneratedColumn> get $columns => [id, amountOnHand];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vault';
  @override
  VerificationContext validateIntegrity(Insertable<VaultModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount_on_hand')) {
      context.handle(
          _amountOnHandMeta,
          amountOnHand.isAcceptableOrUnknown(
              data['amount_on_hand']!, _amountOnHandMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VaultModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VaultModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amountOnHand: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_on_hand'])!,
    );
  }

  @override
  $VaultTable createAlias(String alias) {
    return $VaultTable(attachedDatabase, alias);
  }
}

class VaultModel extends DataClass implements Insertable<VaultModel> {
  final int id;
  final double amountOnHand;
  const VaultModel({required this.id, required this.amountOnHand});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount_on_hand'] = Variable<double>(amountOnHand);
    return map;
  }

  VaultCompanion toCompanion(bool nullToAbsent) {
    return VaultCompanion(
      id: Value(id),
      amountOnHand: Value(amountOnHand),
    );
  }

  factory VaultModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VaultModel(
      id: serializer.fromJson<int>(json['id']),
      amountOnHand: serializer.fromJson<double>(json['amountOnHand']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amountOnHand': serializer.toJson<double>(amountOnHand),
    };
  }

  VaultModel copyWith({int? id, double? amountOnHand}) => VaultModel(
        id: id ?? this.id,
        amountOnHand: amountOnHand ?? this.amountOnHand,
      );
  VaultModel copyWithCompanion(VaultCompanion data) {
    return VaultModel(
      id: data.id.present ? data.id.value : this.id,
      amountOnHand: data.amountOnHand.present
          ? data.amountOnHand.value
          : this.amountOnHand,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VaultModel(')
          ..write('id: $id, ')
          ..write('amountOnHand: $amountOnHand')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amountOnHand);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VaultModel &&
          other.id == this.id &&
          other.amountOnHand == this.amountOnHand);
}

class VaultCompanion extends UpdateCompanion<VaultModel> {
  final Value<int> id;
  final Value<double> amountOnHand;
  const VaultCompanion({
    this.id = const Value.absent(),
    this.amountOnHand = const Value.absent(),
  });
  VaultCompanion.insert({
    this.id = const Value.absent(),
    this.amountOnHand = const Value.absent(),
  });
  static Insertable<VaultModel> custom({
    Expression<int>? id,
    Expression<double>? amountOnHand,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountOnHand != null) 'amount_on_hand': amountOnHand,
    });
  }

  VaultCompanion copyWith({Value<int>? id, Value<double>? amountOnHand}) {
    return VaultCompanion(
      id: id ?? this.id,
      amountOnHand: amountOnHand ?? this.amountOnHand,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amountOnHand.present) {
      map['amount_on_hand'] = Variable<double>(amountOnHand.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaultCompanion(')
          ..write('id: $id, ')
          ..write('amountOnHand: $amountOnHand')
          ..write(')'))
        .toString();
  }
}

class $AddedToVaultTable extends AddedToVault
    with TableInfo<$AddedToVaultTable, AddedToVaultModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddedToVaultTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _vaultIdMeta =
      const VerificationMeta('vaultId');
  @override
  late final GeneratedColumn<int> vaultId = GeneratedColumn<int>(
      'vault_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES vault(id) ON DELETE CASCADE');
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, vaultId, amount, description, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'added_to_vault';
  @override
  VerificationContext validateIntegrity(Insertable<AddedToVaultModel> instance,
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
    if (data.containsKey('vault_id')) {
      context.handle(_vaultIdMeta,
          vaultId.isAcceptableOrUnknown(data['vault_id']!, _vaultIdMeta));
    } else if (isInserting) {
      context.missing(_vaultIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AddedToVaultModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AddedToVaultModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      vaultId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vault_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $AddedToVaultTable createAlias(String alias) {
    return $AddedToVaultTable(attachedDatabase, alias);
  }
}

class AddedToVaultModel extends DataClass
    implements Insertable<AddedToVaultModel> {
  final int id;
  final DateTime date;
  final int vaultId;
  final double amount;
  final String description;
  final String? note;
  const AddedToVaultModel(
      {required this.id,
      required this.date,
      required this.vaultId,
      required this.amount,
      required this.description,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['vault_id'] = Variable<int>(vaultId);
    map['amount'] = Variable<double>(amount);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  AddedToVaultCompanion toCompanion(bool nullToAbsent) {
    return AddedToVaultCompanion(
      id: Value(id),
      date: Value(date),
      vaultId: Value(vaultId),
      amount: Value(amount),
      description: Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory AddedToVaultModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AddedToVaultModel(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      vaultId: serializer.fromJson<int>(json['vaultId']),
      amount: serializer.fromJson<double>(json['amount']),
      description: serializer.fromJson<String>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'vaultId': serializer.toJson<int>(vaultId),
      'amount': serializer.toJson<double>(amount),
      'description': serializer.toJson<String>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  AddedToVaultModel copyWith(
          {int? id,
          DateTime? date,
          int? vaultId,
          double? amount,
          String? description,
          Value<String?> note = const Value.absent()}) =>
      AddedToVaultModel(
        id: id ?? this.id,
        date: date ?? this.date,
        vaultId: vaultId ?? this.vaultId,
        amount: amount ?? this.amount,
        description: description ?? this.description,
        note: note.present ? note.value : this.note,
      );
  AddedToVaultModel copyWithCompanion(AddedToVaultCompanion data) {
    return AddedToVaultModel(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      vaultId: data.vaultId.present ? data.vaultId.value : this.vaultId,
      amount: data.amount.present ? data.amount.value : this.amount,
      description:
          data.description.present ? data.description.value : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AddedToVaultModel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('vaultId: $vaultId, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, vaultId, amount, description, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddedToVaultModel &&
          other.id == this.id &&
          other.date == this.date &&
          other.vaultId == this.vaultId &&
          other.amount == this.amount &&
          other.description == this.description &&
          other.note == this.note);
}

class AddedToVaultCompanion extends UpdateCompanion<AddedToVaultModel> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> vaultId;
  final Value<double> amount;
  final Value<String> description;
  final Value<String?> note;
  const AddedToVaultCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.vaultId = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  AddedToVaultCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required int vaultId,
    required double amount,
    required String description,
    this.note = const Value.absent(),
  })  : vaultId = Value(vaultId),
        amount = Value(amount),
        description = Value(description);
  static Insertable<AddedToVaultModel> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? vaultId,
    Expression<double>? amount,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (vaultId != null) 'vault_id': vaultId,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  AddedToVaultCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? vaultId,
      Value<double>? amount,
      Value<String>? description,
      Value<String?>? note}) {
    return AddedToVaultCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      vaultId: vaultId ?? this.vaultId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      note: note ?? this.note,
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
    if (vaultId.present) {
      map['vault_id'] = Variable<int>(vaultId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddedToVaultCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('vaultId: $vaultId, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $ReducedFromVaultTable extends ReducedFromVault
    with TableInfo<$ReducedFromVaultTable, ReducedFromVaultModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReducedFromVaultTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _vaultIdMeta =
      const VerificationMeta('vaultId');
  @override
  late final GeneratedColumn<int> vaultId = GeneratedColumn<int>(
      'vault_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES vault(id) ON DELETE CASCADE');
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, vaultId, amount, description, note];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reduced_from_vault';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReducedFromVaultModel> instance,
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
    if (data.containsKey('vault_id')) {
      context.handle(_vaultIdMeta,
          vaultId.isAcceptableOrUnknown(data['vault_id']!, _vaultIdMeta));
    } else if (isInserting) {
      context.missing(_vaultIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReducedFromVaultModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReducedFromVaultModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      vaultId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}vault_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
    );
  }

  @override
  $ReducedFromVaultTable createAlias(String alias) {
    return $ReducedFromVaultTable(attachedDatabase, alias);
  }
}

class ReducedFromVaultModel extends DataClass
    implements Insertable<ReducedFromVaultModel> {
  final int id;
  final DateTime date;
  final int vaultId;
  final double amount;
  final String description;
  final String? note;
  const ReducedFromVaultModel(
      {required this.id,
      required this.date,
      required this.vaultId,
      required this.amount,
      required this.description,
      this.note});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['vault_id'] = Variable<int>(vaultId);
    map['amount'] = Variable<double>(amount);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  ReducedFromVaultCompanion toCompanion(bool nullToAbsent) {
    return ReducedFromVaultCompanion(
      id: Value(id),
      date: Value(date),
      vaultId: Value(vaultId),
      amount: Value(amount),
      description: Value(description),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory ReducedFromVaultModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReducedFromVaultModel(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      vaultId: serializer.fromJson<int>(json['vaultId']),
      amount: serializer.fromJson<double>(json['amount']),
      description: serializer.fromJson<String>(json['description']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'vaultId': serializer.toJson<int>(vaultId),
      'amount': serializer.toJson<double>(amount),
      'description': serializer.toJson<String>(description),
      'note': serializer.toJson<String?>(note),
    };
  }

  ReducedFromVaultModel copyWith(
          {int? id,
          DateTime? date,
          int? vaultId,
          double? amount,
          String? description,
          Value<String?> note = const Value.absent()}) =>
      ReducedFromVaultModel(
        id: id ?? this.id,
        date: date ?? this.date,
        vaultId: vaultId ?? this.vaultId,
        amount: amount ?? this.amount,
        description: description ?? this.description,
        note: note.present ? note.value : this.note,
      );
  ReducedFromVaultModel copyWithCompanion(ReducedFromVaultCompanion data) {
    return ReducedFromVaultModel(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      vaultId: data.vaultId.present ? data.vaultId.value : this.vaultId,
      amount: data.amount.present ? data.amount.value : this.amount,
      description:
          data.description.present ? data.description.value : this.description,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReducedFromVaultModel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('vaultId: $vaultId, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, vaultId, amount, description, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReducedFromVaultModel &&
          other.id == this.id &&
          other.date == this.date &&
          other.vaultId == this.vaultId &&
          other.amount == this.amount &&
          other.description == this.description &&
          other.note == this.note);
}

class ReducedFromVaultCompanion extends UpdateCompanion<ReducedFromVaultModel> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> vaultId;
  final Value<double> amount;
  final Value<String> description;
  final Value<String?> note;
  const ReducedFromVaultCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.vaultId = const Value.absent(),
    this.amount = const Value.absent(),
    this.description = const Value.absent(),
    this.note = const Value.absent(),
  });
  ReducedFromVaultCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required int vaultId,
    required double amount,
    required String description,
    this.note = const Value.absent(),
  })  : vaultId = Value(vaultId),
        amount = Value(amount),
        description = Value(description);
  static Insertable<ReducedFromVaultModel> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? vaultId,
    Expression<double>? amount,
    Expression<String>? description,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (vaultId != null) 'vault_id': vaultId,
      if (amount != null) 'amount': amount,
      if (description != null) 'description': description,
      if (note != null) 'note': note,
    });
  }

  ReducedFromVaultCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<int>? vaultId,
      Value<double>? amount,
      Value<String>? description,
      Value<String?>? note}) {
    return ReducedFromVaultCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      vaultId: vaultId ?? this.vaultId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      note: note ?? this.note,
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
    if (vaultId.present) {
      map['vault_id'] = Variable<int>(vaultId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReducedFromVaultCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('vaultId: $vaultId, ')
          ..write('amount: $amount, ')
          ..write('description: $description, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $SellReceiptsTable sellReceipts = $SellReceiptsTable(this);
  late final $SellReceiptItemsTable sellReceiptItems =
      $SellReceiptItemsTable(this);
  late final $SellPaymentsTable sellPayments = $SellPaymentsTable(this);
  late final $BuyReceiptsTable buyReceipts = $BuyReceiptsTable(this);
  late final $BuyReceiptItemsTable buyReceiptItems =
      $BuyReceiptItemsTable(this);
  late final $BuyPaymentsTable buyPayments = $BuyPaymentsTable(this);
  late final $ReturnReceiptsTable returnReceipts = $ReturnReceiptsTable(this);
  late final $ReturnReceiptItemsTable returnReceiptItems =
      $ReturnReceiptItemsTable(this);
  late final $ReturnPaymentsTable returnPayments = $ReturnPaymentsTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $VaultTable vault = $VaultTable(this);
  late final $AddedToVaultTable addedToVault = $AddedToVaultTable(this);
  late final $ReducedFromVaultTable reducedFromVault =
      $ReducedFromVaultTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        items,
        sellReceipts,
        sellReceiptItems,
        sellPayments,
        buyReceipts,
        buyReceiptItems,
        buyPayments,
        returnReceipts,
        returnReceiptItems,
        returnPayments,
        customers,
        suppliers,
        vault,
        addedToVault,
        reducedFromVault
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('vault',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('added_to_vault', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('vault',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('reduced_from_vault', kind: UpdateKind.delete),
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
  Value<String?> description,
  Value<String?> barcode,
  Value<String?> itemUnit,
});
typedef $$ItemsTableUpdateCompanionBuilder = ItemsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<double> quantity,
  Value<double> sellingPrice,
  Value<double> buyingPrice,
  Value<String?> description,
  Value<String?> barcode,
  Value<String?> itemUnit,
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

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get itemUnit => $composableBuilder(
      column: $table.itemUnit, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get itemUnit => $composableBuilder(
      column: $table.itemUnit, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<String> get itemUnit =>
      $composableBuilder(column: $table.itemUnit, builder: (column) => column);
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
            Value<String?> description = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String?> itemUnit = const Value.absent(),
          }) =>
              ItemsCompanion(
            id: id,
            name: name,
            quantity: quantity,
            sellingPrice: sellingPrice,
            buyingPrice: buyingPrice,
            description: description,
            barcode: barcode,
            itemUnit: itemUnit,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required double quantity,
            required double sellingPrice,
            required double buyingPrice,
            Value<String?> description = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<String?> itemUnit = const Value.absent(),
          }) =>
              ItemsCompanion.insert(
            id: id,
            name: name,
            quantity: quantity,
            sellingPrice: sellingPrice,
            buyingPrice: buyingPrice,
            description: description,
            barcode: barcode,
            itemUnit: itemUnit,
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
typedef $$SellReceiptsTableCreateCompanionBuilder = SellReceiptsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int?> customerId,
  required double subTotalPrice,
  Value<double> discount,
  Value<String> discountType,
  Value<double> shippingFee,
  Value<double> taxFee,
  required double totalPrice,
});
typedef $$SellReceiptsTableUpdateCompanionBuilder = SellReceiptsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int?> customerId,
  Value<double> subTotalPrice,
  Value<double> discount,
  Value<String> discountType,
  Value<double> shippingFee,
  Value<double> taxFee,
  Value<double> totalPrice,
});

class $$SellReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $SellReceiptsTable> {
  $$SellReceiptsTableFilterComposer({
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

  ColumnFilters<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxFee => $composableBuilder(
      column: $table.taxFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));
}

class $$SellReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $SellReceiptsTable> {
  $$SellReceiptsTableOrderingComposer({
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

  ColumnOrderings<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountType => $composableBuilder(
      column: $table.discountType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxFee => $composableBuilder(
      column: $table.taxFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));
}

class $$SellReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SellReceiptsTable> {
  $$SellReceiptsTableAnnotationComposer({
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

  GeneratedColumn<int> get customerId => $composableBuilder(
      column: $table.customerId, builder: (column) => column);

  GeneratedColumn<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => column);

  GeneratedColumn<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => column);

  GeneratedColumn<double> get taxFee =>
      $composableBuilder(column: $table.taxFee, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);
}

class $$SellReceiptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SellReceiptsTable,
    SellReceiptsModel,
    $$SellReceiptsTableFilterComposer,
    $$SellReceiptsTableOrderingComposer,
    $$SellReceiptsTableAnnotationComposer,
    $$SellReceiptsTableCreateCompanionBuilder,
    $$SellReceiptsTableUpdateCompanionBuilder,
    (
      SellReceiptsModel,
      BaseReferences<_$AppDatabase, $SellReceiptsTable, SellReceiptsModel>
    ),
    SellReceiptsModel,
    PrefetchHooks Function()> {
  $$SellReceiptsTableTableManager(_$AppDatabase db, $SellReceiptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SellReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SellReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SellReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> customerId = const Value.absent(),
            Value<double> subTotalPrice = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> shippingFee = const Value.absent(),
            Value<double> taxFee = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
          }) =>
              SellReceiptsCompanion(
            id: id,
            date: date,
            customerId: customerId,
            subTotalPrice: subTotalPrice,
            discount: discount,
            discountType: discountType,
            shippingFee: shippingFee,
            taxFee: taxFee,
            totalPrice: totalPrice,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> customerId = const Value.absent(),
            required double subTotalPrice,
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> shippingFee = const Value.absent(),
            Value<double> taxFee = const Value.absent(),
            required double totalPrice,
          }) =>
              SellReceiptsCompanion.insert(
            id: id,
            date: date,
            customerId: customerId,
            subTotalPrice: subTotalPrice,
            discount: discount,
            discountType: discountType,
            shippingFee: shippingFee,
            taxFee: taxFee,
            totalPrice: totalPrice,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SellReceiptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SellReceiptsTable,
    SellReceiptsModel,
    $$SellReceiptsTableFilterComposer,
    $$SellReceiptsTableOrderingComposer,
    $$SellReceiptsTableAnnotationComposer,
    $$SellReceiptsTableCreateCompanionBuilder,
    $$SellReceiptsTableUpdateCompanionBuilder,
    (
      SellReceiptsModel,
      BaseReferences<_$AppDatabase, $SellReceiptsTable, SellReceiptsModel>
    ),
    SellReceiptsModel,
    PrefetchHooks Function()>;
typedef $$SellReceiptItemsTableCreateCompanionBuilder
    = SellReceiptItemsCompanion Function({
  Value<int> id,
  required int receiptId,
  required int itemId,
  required double quantity,
  required double price,
  required double costPrice,
});
typedef $$SellReceiptItemsTableUpdateCompanionBuilder
    = SellReceiptItemsCompanion Function({
  Value<int> id,
  Value<int> receiptId,
  Value<int> itemId,
  Value<double> quantity,
  Value<double> price,
  Value<double> costPrice,
});

class $$SellReceiptItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SellReceiptItemsTable> {
  $$SellReceiptItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));
}

class $$SellReceiptItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SellReceiptItemsTable> {
  $$SellReceiptItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));
}

class $$SellReceiptItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SellReceiptItemsTable> {
  $$SellReceiptItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);
}

class $$SellReceiptItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SellReceiptItemsTable,
    SellReceiptItemsModel,
    $$SellReceiptItemsTableFilterComposer,
    $$SellReceiptItemsTableOrderingComposer,
    $$SellReceiptItemsTableAnnotationComposer,
    $$SellReceiptItemsTableCreateCompanionBuilder,
    $$SellReceiptItemsTableUpdateCompanionBuilder,
    (
      SellReceiptItemsModel,
      BaseReferences<_$AppDatabase, $SellReceiptItemsTable,
          SellReceiptItemsModel>
    ),
    SellReceiptItemsModel,
    PrefetchHooks Function()> {
  $$SellReceiptItemsTableTableManager(
      _$AppDatabase db, $SellReceiptItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SellReceiptItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SellReceiptItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SellReceiptItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double> costPrice = const Value.absent(),
          }) =>
              SellReceiptItemsCompanion(
            id: id,
            receiptId: receiptId,
            itemId: itemId,
            quantity: quantity,
            price: price,
            costPrice: costPrice,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int receiptId,
            required int itemId,
            required double quantity,
            required double price,
            required double costPrice,
          }) =>
              SellReceiptItemsCompanion.insert(
            id: id,
            receiptId: receiptId,
            itemId: itemId,
            quantity: quantity,
            price: price,
            costPrice: costPrice,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SellReceiptItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SellReceiptItemsTable,
    SellReceiptItemsModel,
    $$SellReceiptItemsTableFilterComposer,
    $$SellReceiptItemsTableOrderingComposer,
    $$SellReceiptItemsTableAnnotationComposer,
    $$SellReceiptItemsTableCreateCompanionBuilder,
    $$SellReceiptItemsTableUpdateCompanionBuilder,
    (
      SellReceiptItemsModel,
      BaseReferences<_$AppDatabase, $SellReceiptItemsTable,
          SellReceiptItemsModel>
    ),
    SellReceiptItemsModel,
    PrefetchHooks Function()>;
typedef $$SellPaymentsTableCreateCompanionBuilder = SellPaymentsCompanion
    Function({
  Value<int> id,
  required int receiptId,
  required String paymentMethod,
  required double paidAmount,
  required double debtAmount,
  Value<DateTime> paymentDate,
  Value<String> status,
});
typedef $$SellPaymentsTableUpdateCompanionBuilder = SellPaymentsCompanion
    Function({
  Value<int> id,
  Value<int> receiptId,
  Value<String> paymentMethod,
  Value<double> paidAmount,
  Value<double> debtAmount,
  Value<DateTime> paymentDate,
  Value<String> status,
});

class $$SellPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $SellPaymentsTable> {
  $$SellPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$SellPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $SellPaymentsTable> {
  $$SellPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$SellPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SellPaymentsTable> {
  $$SellPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SellPaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SellPaymentsTable,
    SellPaymentsModel,
    $$SellPaymentsTableFilterComposer,
    $$SellPaymentsTableOrderingComposer,
    $$SellPaymentsTableAnnotationComposer,
    $$SellPaymentsTableCreateCompanionBuilder,
    $$SellPaymentsTableUpdateCompanionBuilder,
    (
      SellPaymentsModel,
      BaseReferences<_$AppDatabase, $SellPaymentsTable, SellPaymentsModel>
    ),
    SellPaymentsModel,
    PrefetchHooks Function()> {
  $$SellPaymentsTableTableManager(_$AppDatabase db, $SellPaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SellPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SellPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SellPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> debtAmount = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              SellPaymentsCompanion(
            id: id,
            receiptId: receiptId,
            paymentMethod: paymentMethod,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            paymentDate: paymentDate,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int receiptId,
            required String paymentMethod,
            required double paidAmount,
            required double debtAmount,
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              SellPaymentsCompanion.insert(
            id: id,
            receiptId: receiptId,
            paymentMethod: paymentMethod,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            paymentDate: paymentDate,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SellPaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SellPaymentsTable,
    SellPaymentsModel,
    $$SellPaymentsTableFilterComposer,
    $$SellPaymentsTableOrderingComposer,
    $$SellPaymentsTableAnnotationComposer,
    $$SellPaymentsTableCreateCompanionBuilder,
    $$SellPaymentsTableUpdateCompanionBuilder,
    (
      SellPaymentsModel,
      BaseReferences<_$AppDatabase, $SellPaymentsTable, SellPaymentsModel>
    ),
    SellPaymentsModel,
    PrefetchHooks Function()>;
typedef $$BuyReceiptsTableCreateCompanionBuilder = BuyReceiptsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int?> supplierId,
  required double subTotalPrice,
  Value<double> discount,
  Value<String> discountType,
  Value<double> shippingFee,
  Value<double> taxFee,
  required double totalPrice,
});
typedef $$BuyReceiptsTableUpdateCompanionBuilder = BuyReceiptsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int?> supplierId,
  Value<double> subTotalPrice,
  Value<double> discount,
  Value<String> discountType,
  Value<double> shippingFee,
  Value<double> taxFee,
  Value<double> totalPrice,
});

class $$BuyReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $BuyReceiptsTable> {
  $$BuyReceiptsTableFilterComposer({
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

  ColumnFilters<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxFee => $composableBuilder(
      column: $table.taxFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));
}

class $$BuyReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $BuyReceiptsTable> {
  $$BuyReceiptsTableOrderingComposer({
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

  ColumnOrderings<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountType => $composableBuilder(
      column: $table.discountType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxFee => $composableBuilder(
      column: $table.taxFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));
}

class $$BuyReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuyReceiptsTable> {
  $$BuyReceiptsTableAnnotationComposer({
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

  GeneratedColumn<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => column);

  GeneratedColumn<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => column);

  GeneratedColumn<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => column);

  GeneratedColumn<double> get taxFee =>
      $composableBuilder(column: $table.taxFee, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);
}

class $$BuyReceiptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BuyReceiptsTable,
    BuyReceiptsModel,
    $$BuyReceiptsTableFilterComposer,
    $$BuyReceiptsTableOrderingComposer,
    $$BuyReceiptsTableAnnotationComposer,
    $$BuyReceiptsTableCreateCompanionBuilder,
    $$BuyReceiptsTableUpdateCompanionBuilder,
    (
      BuyReceiptsModel,
      BaseReferences<_$AppDatabase, $BuyReceiptsTable, BuyReceiptsModel>
    ),
    BuyReceiptsModel,
    PrefetchHooks Function()> {
  $$BuyReceiptsTableTableManager(_$AppDatabase db, $BuyReceiptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuyReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuyReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuyReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> supplierId = const Value.absent(),
            Value<double> subTotalPrice = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> shippingFee = const Value.absent(),
            Value<double> taxFee = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
          }) =>
              BuyReceiptsCompanion(
            id: id,
            date: date,
            supplierId: supplierId,
            subTotalPrice: subTotalPrice,
            discount: discount,
            discountType: discountType,
            shippingFee: shippingFee,
            taxFee: taxFee,
            totalPrice: totalPrice,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> supplierId = const Value.absent(),
            required double subTotalPrice,
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> shippingFee = const Value.absent(),
            Value<double> taxFee = const Value.absent(),
            required double totalPrice,
          }) =>
              BuyReceiptsCompanion.insert(
            id: id,
            date: date,
            supplierId: supplierId,
            subTotalPrice: subTotalPrice,
            discount: discount,
            discountType: discountType,
            shippingFee: shippingFee,
            taxFee: taxFee,
            totalPrice: totalPrice,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BuyReceiptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BuyReceiptsTable,
    BuyReceiptsModel,
    $$BuyReceiptsTableFilterComposer,
    $$BuyReceiptsTableOrderingComposer,
    $$BuyReceiptsTableAnnotationComposer,
    $$BuyReceiptsTableCreateCompanionBuilder,
    $$BuyReceiptsTableUpdateCompanionBuilder,
    (
      BuyReceiptsModel,
      BaseReferences<_$AppDatabase, $BuyReceiptsTable, BuyReceiptsModel>
    ),
    BuyReceiptsModel,
    PrefetchHooks Function()>;
typedef $$BuyReceiptItemsTableCreateCompanionBuilder = BuyReceiptItemsCompanion
    Function({
  Value<int> id,
  required int receiptId,
  required int itemId,
  required double quantity,
  required double price,
});
typedef $$BuyReceiptItemsTableUpdateCompanionBuilder = BuyReceiptItemsCompanion
    Function({
  Value<int> id,
  Value<int> receiptId,
  Value<int> itemId,
  Value<double> quantity,
  Value<double> price,
});

class $$BuyReceiptItemsTableFilterComposer
    extends Composer<_$AppDatabase, $BuyReceiptItemsTable> {
  $$BuyReceiptItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));
}

class $$BuyReceiptItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $BuyReceiptItemsTable> {
  $$BuyReceiptItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));
}

class $$BuyReceiptItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuyReceiptItemsTable> {
  $$BuyReceiptItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$BuyReceiptItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BuyReceiptItemsTable,
    BuyReceiptItemsModel,
    $$BuyReceiptItemsTableFilterComposer,
    $$BuyReceiptItemsTableOrderingComposer,
    $$BuyReceiptItemsTableAnnotationComposer,
    $$BuyReceiptItemsTableCreateCompanionBuilder,
    $$BuyReceiptItemsTableUpdateCompanionBuilder,
    (
      BuyReceiptItemsModel,
      BaseReferences<_$AppDatabase, $BuyReceiptItemsTable, BuyReceiptItemsModel>
    ),
    BuyReceiptItemsModel,
    PrefetchHooks Function()> {
  $$BuyReceiptItemsTableTableManager(
      _$AppDatabase db, $BuyReceiptItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuyReceiptItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuyReceiptItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuyReceiptItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> price = const Value.absent(),
          }) =>
              BuyReceiptItemsCompanion(
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
              BuyReceiptItemsCompanion.insert(
            id: id,
            receiptId: receiptId,
            itemId: itemId,
            quantity: quantity,
            price: price,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BuyReceiptItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BuyReceiptItemsTable,
    BuyReceiptItemsModel,
    $$BuyReceiptItemsTableFilterComposer,
    $$BuyReceiptItemsTableOrderingComposer,
    $$BuyReceiptItemsTableAnnotationComposer,
    $$BuyReceiptItemsTableCreateCompanionBuilder,
    $$BuyReceiptItemsTableUpdateCompanionBuilder,
    (
      BuyReceiptItemsModel,
      BaseReferences<_$AppDatabase, $BuyReceiptItemsTable, BuyReceiptItemsModel>
    ),
    BuyReceiptItemsModel,
    PrefetchHooks Function()>;
typedef $$BuyPaymentsTableCreateCompanionBuilder = BuyPaymentsCompanion
    Function({
  Value<int> id,
  required int receiptId,
  required String paymentMethod,
  required double paidAmount,
  required double debtAmount,
  Value<DateTime> paymentDate,
  Value<String> status,
});
typedef $$BuyPaymentsTableUpdateCompanionBuilder = BuyPaymentsCompanion
    Function({
  Value<int> id,
  Value<int> receiptId,
  Value<String> paymentMethod,
  Value<double> paidAmount,
  Value<double> debtAmount,
  Value<DateTime> paymentDate,
  Value<String> status,
});

class $$BuyPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $BuyPaymentsTable> {
  $$BuyPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$BuyPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $BuyPaymentsTable> {
  $$BuyPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$BuyPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BuyPaymentsTable> {
  $$BuyPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$BuyPaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BuyPaymentsTable,
    BuyPaymentsModel,
    $$BuyPaymentsTableFilterComposer,
    $$BuyPaymentsTableOrderingComposer,
    $$BuyPaymentsTableAnnotationComposer,
    $$BuyPaymentsTableCreateCompanionBuilder,
    $$BuyPaymentsTableUpdateCompanionBuilder,
    (
      BuyPaymentsModel,
      BaseReferences<_$AppDatabase, $BuyPaymentsTable, BuyPaymentsModel>
    ),
    BuyPaymentsModel,
    PrefetchHooks Function()> {
  $$BuyPaymentsTableTableManager(_$AppDatabase db, $BuyPaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BuyPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BuyPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BuyPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> debtAmount = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              BuyPaymentsCompanion(
            id: id,
            receiptId: receiptId,
            paymentMethod: paymentMethod,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            paymentDate: paymentDate,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int receiptId,
            required String paymentMethod,
            required double paidAmount,
            required double debtAmount,
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              BuyPaymentsCompanion.insert(
            id: id,
            receiptId: receiptId,
            paymentMethod: paymentMethod,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            paymentDate: paymentDate,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BuyPaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BuyPaymentsTable,
    BuyPaymentsModel,
    $$BuyPaymentsTableFilterComposer,
    $$BuyPaymentsTableOrderingComposer,
    $$BuyPaymentsTableAnnotationComposer,
    $$BuyPaymentsTableCreateCompanionBuilder,
    $$BuyPaymentsTableUpdateCompanionBuilder,
    (
      BuyPaymentsModel,
      BaseReferences<_$AppDatabase, $BuyPaymentsTable, BuyPaymentsModel>
    ),
    BuyPaymentsModel,
    PrefetchHooks Function()>;
typedef $$ReturnReceiptsTableCreateCompanionBuilder = ReturnReceiptsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  required double subTotalPrice,
  Value<double> discount,
  Value<String> discountType,
  Value<double> shippingFee,
  Value<double> taxFee,
  required double totalPrice,
});
typedef $$ReturnReceiptsTableUpdateCompanionBuilder = ReturnReceiptsCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<double> subTotalPrice,
  Value<double> discount,
  Value<String> discountType,
  Value<double> shippingFee,
  Value<double> taxFee,
  Value<double> totalPrice,
});

class $$ReturnReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnReceiptsTable> {
  $$ReturnReceiptsTableFilterComposer({
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

  ColumnFilters<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxFee => $composableBuilder(
      column: $table.taxFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));
}

class $$ReturnReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnReceiptsTable> {
  $$ReturnReceiptsTableOrderingComposer({
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

  ColumnOrderings<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountType => $composableBuilder(
      column: $table.discountType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxFee => $composableBuilder(
      column: $table.taxFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));
}

class $$ReturnReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnReceiptsTable> {
  $$ReturnReceiptsTableAnnotationComposer({
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

  GeneratedColumn<double> get subTotalPrice => $composableBuilder(
      column: $table.subTotalPrice, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => column);

  GeneratedColumn<double> get shippingFee => $composableBuilder(
      column: $table.shippingFee, builder: (column) => column);

  GeneratedColumn<double> get taxFee =>
      $composableBuilder(column: $table.taxFee, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);
}

class $$ReturnReceiptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReturnReceiptsTable,
    ReturnReceiptsModel,
    $$ReturnReceiptsTableFilterComposer,
    $$ReturnReceiptsTableOrderingComposer,
    $$ReturnReceiptsTableAnnotationComposer,
    $$ReturnReceiptsTableCreateCompanionBuilder,
    $$ReturnReceiptsTableUpdateCompanionBuilder,
    (
      ReturnReceiptsModel,
      BaseReferences<_$AppDatabase, $ReturnReceiptsTable, ReturnReceiptsModel>
    ),
    ReturnReceiptsModel,
    PrefetchHooks Function()> {
  $$ReturnReceiptsTableTableManager(
      _$AppDatabase db, $ReturnReceiptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> subTotalPrice = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> shippingFee = const Value.absent(),
            Value<double> taxFee = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
          }) =>
              ReturnReceiptsCompanion(
            id: id,
            date: date,
            subTotalPrice: subTotalPrice,
            discount: discount,
            discountType: discountType,
            shippingFee: shippingFee,
            taxFee: taxFee,
            totalPrice: totalPrice,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            required double subTotalPrice,
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<double> shippingFee = const Value.absent(),
            Value<double> taxFee = const Value.absent(),
            required double totalPrice,
          }) =>
              ReturnReceiptsCompanion.insert(
            id: id,
            date: date,
            subTotalPrice: subTotalPrice,
            discount: discount,
            discountType: discountType,
            shippingFee: shippingFee,
            taxFee: taxFee,
            totalPrice: totalPrice,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReturnReceiptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReturnReceiptsTable,
    ReturnReceiptsModel,
    $$ReturnReceiptsTableFilterComposer,
    $$ReturnReceiptsTableOrderingComposer,
    $$ReturnReceiptsTableAnnotationComposer,
    $$ReturnReceiptsTableCreateCompanionBuilder,
    $$ReturnReceiptsTableUpdateCompanionBuilder,
    (
      ReturnReceiptsModel,
      BaseReferences<_$AppDatabase, $ReturnReceiptsTable, ReturnReceiptsModel>
    ),
    ReturnReceiptsModel,
    PrefetchHooks Function()>;
typedef $$ReturnReceiptItemsTableCreateCompanionBuilder
    = ReturnReceiptItemsCompanion Function({
  Value<int> id,
  required int receiptId,
  required int itemId,
  required double quantity,
  required double price,
});
typedef $$ReturnReceiptItemsTableUpdateCompanionBuilder
    = ReturnReceiptItemsCompanion Function({
  Value<int> id,
  Value<int> receiptId,
  Value<int> itemId,
  Value<double> quantity,
  Value<double> price,
});

class $$ReturnReceiptItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnReceiptItemsTable> {
  $$ReturnReceiptItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));
}

class $$ReturnReceiptItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnReceiptItemsTable> {
  $$ReturnReceiptItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get itemId => $composableBuilder(
      column: $table.itemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));
}

class $$ReturnReceiptItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnReceiptItemsTable> {
  $$ReturnReceiptItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);
}

class $$ReturnReceiptItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReturnReceiptItemsTable,
    ReturnReceiptItemsModel,
    $$ReturnReceiptItemsTableFilterComposer,
    $$ReturnReceiptItemsTableOrderingComposer,
    $$ReturnReceiptItemsTableAnnotationComposer,
    $$ReturnReceiptItemsTableCreateCompanionBuilder,
    $$ReturnReceiptItemsTableUpdateCompanionBuilder,
    (
      ReturnReceiptItemsModel,
      BaseReferences<_$AppDatabase, $ReturnReceiptItemsTable,
          ReturnReceiptItemsModel>
    ),
    ReturnReceiptItemsModel,
    PrefetchHooks Function()> {
  $$ReturnReceiptItemsTableTableManager(
      _$AppDatabase db, $ReturnReceiptItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnReceiptItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnReceiptItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnReceiptItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<int> itemId = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> price = const Value.absent(),
          }) =>
              ReturnReceiptItemsCompanion(
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
              ReturnReceiptItemsCompanion.insert(
            id: id,
            receiptId: receiptId,
            itemId: itemId,
            quantity: quantity,
            price: price,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReturnReceiptItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReturnReceiptItemsTable,
    ReturnReceiptItemsModel,
    $$ReturnReceiptItemsTableFilterComposer,
    $$ReturnReceiptItemsTableOrderingComposer,
    $$ReturnReceiptItemsTableAnnotationComposer,
    $$ReturnReceiptItemsTableCreateCompanionBuilder,
    $$ReturnReceiptItemsTableUpdateCompanionBuilder,
    (
      ReturnReceiptItemsModel,
      BaseReferences<_$AppDatabase, $ReturnReceiptItemsTable,
          ReturnReceiptItemsModel>
    ),
    ReturnReceiptItemsModel,
    PrefetchHooks Function()>;
typedef $$ReturnPaymentsTableCreateCompanionBuilder = ReturnPaymentsCompanion
    Function({
  Value<int> id,
  required int receiptId,
  required String paymentMethod,
  required double paidAmount,
  required double debtAmount,
  Value<DateTime> paymentDate,
  Value<String> status,
});
typedef $$ReturnPaymentsTableUpdateCompanionBuilder = ReturnPaymentsCompanion
    Function({
  Value<int> id,
  Value<int> receiptId,
  Value<String> paymentMethod,
  Value<double> paidAmount,
  Value<double> debtAmount,
  Value<DateTime> paymentDate,
  Value<String> status,
});

class $$ReturnPaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $ReturnPaymentsTable> {
  $$ReturnPaymentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$ReturnPaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReturnPaymentsTable> {
  $$ReturnPaymentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get receiptId => $composableBuilder(
      column: $table.receiptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$ReturnPaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReturnPaymentsTable> {
  $$ReturnPaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get receiptId =>
      $composableBuilder(column: $table.receiptId, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<double> get debtAmount => $composableBuilder(
      column: $table.debtAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ReturnPaymentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReturnPaymentsTable,
    ReturnPaymentsModel,
    $$ReturnPaymentsTableFilterComposer,
    $$ReturnPaymentsTableOrderingComposer,
    $$ReturnPaymentsTableAnnotationComposer,
    $$ReturnPaymentsTableCreateCompanionBuilder,
    $$ReturnPaymentsTableUpdateCompanionBuilder,
    (
      ReturnPaymentsModel,
      BaseReferences<_$AppDatabase, $ReturnPaymentsTable, ReturnPaymentsModel>
    ),
    ReturnPaymentsModel,
    PrefetchHooks Function()> {
  $$ReturnPaymentsTableTableManager(
      _$AppDatabase db, $ReturnPaymentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReturnPaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReturnPaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReturnPaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<double> paidAmount = const Value.absent(),
            Value<double> debtAmount = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              ReturnPaymentsCompanion(
            id: id,
            receiptId: receiptId,
            paymentMethod: paymentMethod,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            paymentDate: paymentDate,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int receiptId,
            required String paymentMethod,
            required double paidAmount,
            required double debtAmount,
            Value<DateTime> paymentDate = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              ReturnPaymentsCompanion.insert(
            id: id,
            receiptId: receiptId,
            paymentMethod: paymentMethod,
            paidAmount: paidAmount,
            debtAmount: debtAmount,
            paymentDate: paymentDate,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReturnPaymentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReturnPaymentsTable,
    ReturnPaymentsModel,
    $$ReturnPaymentsTableFilterComposer,
    $$ReturnPaymentsTableOrderingComposer,
    $$ReturnPaymentsTableAnnotationComposer,
    $$ReturnPaymentsTableCreateCompanionBuilder,
    $$ReturnPaymentsTableUpdateCompanionBuilder,
    (
      ReturnPaymentsModel,
      BaseReferences<_$AppDatabase, $ReturnPaymentsTable, ReturnPaymentsModel>
    ),
    ReturnPaymentsModel,
    PrefetchHooks Function()>;
typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phoneNumber,
  Value<String?> street,
  Value<String?> extraPhoneNumber,
  Value<String?> city,
  Value<String?> state,
  Value<String?> country,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phoneNumber,
  Value<String?> street,
  Value<String?> extraPhoneNumber,
  Value<String?> city,
  Value<String?> state,
  Value<String?> country,
});

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
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

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get extraPhoneNumber => $composableBuilder(
      column: $table.extraPhoneNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
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

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extraPhoneNumber => $composableBuilder(
      column: $table.extraPhoneNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
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

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get extraPhoneNumber => $composableBuilder(
      column: $table.extraPhoneNumber, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);
}

class $$CustomersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersTable,
    CustomerData,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (
      CustomerData,
      BaseReferences<_$AppDatabase, $CustomersTable, CustomerData>
    ),
    CustomerData,
    PrefetchHooks Function()> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> extraPhoneNumber = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> country = const Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            street: street,
            extraPhoneNumber: extraPhoneNumber,
            city: city,
            state: state,
            country: country,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phoneNumber = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> extraPhoneNumber = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> country = const Value.absent(),
          }) =>
              CustomersCompanion.insert(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            street: street,
            extraPhoneNumber: extraPhoneNumber,
            city: city,
            state: state,
            country: country,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersTable,
    CustomerData,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (
      CustomerData,
      BaseReferences<_$AppDatabase, $CustomersTable, CustomerData>
    ),
    CustomerData,
    PrefetchHooks Function()>;
typedef $$SuppliersTableCreateCompanionBuilder = SuppliersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phoneNumber,
  Value<String?> street,
  Value<String?> extraPhoneNumber,
  Value<String?> city,
  Value<String?> state,
  Value<String?> country,
});
typedef $$SuppliersTableUpdateCompanionBuilder = SuppliersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phoneNumber,
  Value<String?> street,
  Value<String?> extraPhoneNumber,
  Value<String?> city,
  Value<String?> state,
  Value<String?> country,
});

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
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

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get extraPhoneNumber => $composableBuilder(
      column: $table.extraPhoneNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
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

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get street => $composableBuilder(
      column: $table.street, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extraPhoneNumber => $composableBuilder(
      column: $table.extraPhoneNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
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

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get extraPhoneNumber => $composableBuilder(
      column: $table.extraPhoneNumber, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);
}

class $$SuppliersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SuppliersTable,
    SupplierData,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (
      SupplierData,
      BaseReferences<_$AppDatabase, $SuppliersTable, SupplierData>
    ),
    SupplierData,
    PrefetchHooks Function()> {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phoneNumber = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> extraPhoneNumber = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> country = const Value.absent(),
          }) =>
              SuppliersCompanion(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            street: street,
            extraPhoneNumber: extraPhoneNumber,
            city: city,
            state: state,
            country: country,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phoneNumber = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> extraPhoneNumber = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> country = const Value.absent(),
          }) =>
              SuppliersCompanion.insert(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            street: street,
            extraPhoneNumber: extraPhoneNumber,
            city: city,
            state: state,
            country: country,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SuppliersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SuppliersTable,
    SupplierData,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (
      SupplierData,
      BaseReferences<_$AppDatabase, $SuppliersTable, SupplierData>
    ),
    SupplierData,
    PrefetchHooks Function()>;
typedef $$VaultTableCreateCompanionBuilder = VaultCompanion Function({
  Value<int> id,
  Value<double> amountOnHand,
});
typedef $$VaultTableUpdateCompanionBuilder = VaultCompanion Function({
  Value<int> id,
  Value<double> amountOnHand,
});

final class $$VaultTableReferences
    extends BaseReferences<_$AppDatabase, $VaultTable, VaultModel> {
  $$VaultTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AddedToVaultTable, List<AddedToVaultModel>>
      _addedToVaultRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.addedToVault,
              aliasName:
                  $_aliasNameGenerator(db.vault.id, db.addedToVault.vaultId));

  $$AddedToVaultTableProcessedTableManager get addedToVaultRefs {
    final manager = $$AddedToVaultTableTableManager($_db, $_db.addedToVault)
        .filter((f) => f.vaultId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_addedToVaultRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ReducedFromVaultTable,
      List<ReducedFromVaultModel>> _reducedFromVaultRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.reducedFromVault,
          aliasName:
              $_aliasNameGenerator(db.vault.id, db.reducedFromVault.vaultId));

  $$ReducedFromVaultTableProcessedTableManager get reducedFromVaultRefs {
    final manager =
        $$ReducedFromVaultTableTableManager($_db, $_db.reducedFromVault)
            .filter((f) => f.vaultId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_reducedFromVaultRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$VaultTableFilterComposer extends Composer<_$AppDatabase, $VaultTable> {
  $$VaultTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountOnHand => $composableBuilder(
      column: $table.amountOnHand, builder: (column) => ColumnFilters(column));

  Expression<bool> addedToVaultRefs(
      Expression<bool> Function($$AddedToVaultTableFilterComposer f) f) {
    final $$AddedToVaultTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.addedToVault,
        getReferencedColumn: (t) => t.vaultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AddedToVaultTableFilterComposer(
              $db: $db,
              $table: $db.addedToVault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> reducedFromVaultRefs(
      Expression<bool> Function($$ReducedFromVaultTableFilterComposer f) f) {
    final $$ReducedFromVaultTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reducedFromVault,
        getReferencedColumn: (t) => t.vaultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReducedFromVaultTableFilterComposer(
              $db: $db,
              $table: $db.reducedFromVault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VaultTableOrderingComposer
    extends Composer<_$AppDatabase, $VaultTable> {
  $$VaultTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountOnHand => $composableBuilder(
      column: $table.amountOnHand,
      builder: (column) => ColumnOrderings(column));
}

class $$VaultTableAnnotationComposer
    extends Composer<_$AppDatabase, $VaultTable> {
  $$VaultTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amountOnHand => $composableBuilder(
      column: $table.amountOnHand, builder: (column) => column);

  Expression<T> addedToVaultRefs<T extends Object>(
      Expression<T> Function($$AddedToVaultTableAnnotationComposer a) f) {
    final $$AddedToVaultTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.addedToVault,
        getReferencedColumn: (t) => t.vaultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AddedToVaultTableAnnotationComposer(
              $db: $db,
              $table: $db.addedToVault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> reducedFromVaultRefs<T extends Object>(
      Expression<T> Function($$ReducedFromVaultTableAnnotationComposer a) f) {
    final $$ReducedFromVaultTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reducedFromVault,
        getReferencedColumn: (t) => t.vaultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReducedFromVaultTableAnnotationComposer(
              $db: $db,
              $table: $db.reducedFromVault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$VaultTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VaultTable,
    VaultModel,
    $$VaultTableFilterComposer,
    $$VaultTableOrderingComposer,
    $$VaultTableAnnotationComposer,
    $$VaultTableCreateCompanionBuilder,
    $$VaultTableUpdateCompanionBuilder,
    (VaultModel, $$VaultTableReferences),
    VaultModel,
    PrefetchHooks Function(
        {bool addedToVaultRefs, bool reducedFromVaultRefs})> {
  $$VaultTableTableManager(_$AppDatabase db, $VaultTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VaultTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VaultTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VaultTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amountOnHand = const Value.absent(),
          }) =>
              VaultCompanion(
            id: id,
            amountOnHand: amountOnHand,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> amountOnHand = const Value.absent(),
          }) =>
              VaultCompanion.insert(
            id: id,
            amountOnHand: amountOnHand,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$VaultTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {addedToVaultRefs = false, reducedFromVaultRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (addedToVaultRefs) db.addedToVault,
                if (reducedFromVaultRefs) db.reducedFromVault
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (addedToVaultRefs)
                    await $_getPrefetchedData<VaultModel, $VaultTable,
                            AddedToVaultModel>(
                        currentTable: table,
                        referencedTable:
                            $$VaultTableReferences._addedToVaultRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VaultTableReferences(db, table, p0)
                                .addedToVaultRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.vaultId == item.id),
                        typedResults: items),
                  if (reducedFromVaultRefs)
                    await $_getPrefetchedData<VaultModel, $VaultTable,
                            ReducedFromVaultModel>(
                        currentTable: table,
                        referencedTable: $$VaultTableReferences
                            ._reducedFromVaultRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$VaultTableReferences(db, table, p0)
                                .reducedFromVaultRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.vaultId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$VaultTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VaultTable,
    VaultModel,
    $$VaultTableFilterComposer,
    $$VaultTableOrderingComposer,
    $$VaultTableAnnotationComposer,
    $$VaultTableCreateCompanionBuilder,
    $$VaultTableUpdateCompanionBuilder,
    (VaultModel, $$VaultTableReferences),
    VaultModel,
    PrefetchHooks Function({bool addedToVaultRefs, bool reducedFromVaultRefs})>;
typedef $$AddedToVaultTableCreateCompanionBuilder = AddedToVaultCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  required int vaultId,
  required double amount,
  required String description,
  Value<String?> note,
});
typedef $$AddedToVaultTableUpdateCompanionBuilder = AddedToVaultCompanion
    Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int> vaultId,
  Value<double> amount,
  Value<String> description,
  Value<String?> note,
});

final class $$AddedToVaultTableReferences extends BaseReferences<_$AppDatabase,
    $AddedToVaultTable, AddedToVaultModel> {
  $$AddedToVaultTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VaultTable _vaultIdTable(_$AppDatabase db) => db.vault
      .createAlias($_aliasNameGenerator(db.addedToVault.vaultId, db.vault.id));

  $$VaultTableProcessedTableManager get vaultId {
    final $_column = $_itemColumn<int>('vault_id')!;

    final manager = $$VaultTableTableManager($_db, $_db.vault)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vaultIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AddedToVaultTableFilterComposer
    extends Composer<_$AppDatabase, $AddedToVaultTable> {
  $$AddedToVaultTableFilterComposer({
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

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  $$VaultTableFilterComposer get vaultId {
    final $$VaultTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaultId,
        referencedTable: $db.vault,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaultTableFilterComposer(
              $db: $db,
              $table: $db.vault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AddedToVaultTableOrderingComposer
    extends Composer<_$AppDatabase, $AddedToVaultTable> {
  $$AddedToVaultTableOrderingComposer({
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

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  $$VaultTableOrderingComposer get vaultId {
    final $$VaultTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaultId,
        referencedTable: $db.vault,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaultTableOrderingComposer(
              $db: $db,
              $table: $db.vault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AddedToVaultTableAnnotationComposer
    extends Composer<_$AppDatabase, $AddedToVaultTable> {
  $$AddedToVaultTableAnnotationComposer({
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$VaultTableAnnotationComposer get vaultId {
    final $$VaultTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaultId,
        referencedTable: $db.vault,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaultTableAnnotationComposer(
              $db: $db,
              $table: $db.vault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AddedToVaultTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AddedToVaultTable,
    AddedToVaultModel,
    $$AddedToVaultTableFilterComposer,
    $$AddedToVaultTableOrderingComposer,
    $$AddedToVaultTableAnnotationComposer,
    $$AddedToVaultTableCreateCompanionBuilder,
    $$AddedToVaultTableUpdateCompanionBuilder,
    (AddedToVaultModel, $$AddedToVaultTableReferences),
    AddedToVaultModel,
    PrefetchHooks Function({bool vaultId})> {
  $$AddedToVaultTableTableManager(_$AppDatabase db, $AddedToVaultTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AddedToVaultTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AddedToVaultTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AddedToVaultTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> vaultId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              AddedToVaultCompanion(
            id: id,
            date: date,
            vaultId: vaultId,
            amount: amount,
            description: description,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            required int vaultId,
            required double amount,
            required String description,
            Value<String?> note = const Value.absent(),
          }) =>
              AddedToVaultCompanion.insert(
            id: id,
            date: date,
            vaultId: vaultId,
            amount: amount,
            description: description,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AddedToVaultTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({vaultId = false}) {
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
                if (vaultId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vaultId,
                    referencedTable:
                        $$AddedToVaultTableReferences._vaultIdTable(db),
                    referencedColumn:
                        $$AddedToVaultTableReferences._vaultIdTable(db).id,
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

typedef $$AddedToVaultTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AddedToVaultTable,
    AddedToVaultModel,
    $$AddedToVaultTableFilterComposer,
    $$AddedToVaultTableOrderingComposer,
    $$AddedToVaultTableAnnotationComposer,
    $$AddedToVaultTableCreateCompanionBuilder,
    $$AddedToVaultTableUpdateCompanionBuilder,
    (AddedToVaultModel, $$AddedToVaultTableReferences),
    AddedToVaultModel,
    PrefetchHooks Function({bool vaultId})>;
typedef $$ReducedFromVaultTableCreateCompanionBuilder
    = ReducedFromVaultCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  required int vaultId,
  required double amount,
  required String description,
  Value<String?> note,
});
typedef $$ReducedFromVaultTableUpdateCompanionBuilder
    = ReducedFromVaultCompanion Function({
  Value<int> id,
  Value<DateTime> date,
  Value<int> vaultId,
  Value<double> amount,
  Value<String> description,
  Value<String?> note,
});

final class $$ReducedFromVaultTableReferences extends BaseReferences<
    _$AppDatabase, $ReducedFromVaultTable, ReducedFromVaultModel> {
  $$ReducedFromVaultTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $VaultTable _vaultIdTable(_$AppDatabase db) => db.vault.createAlias(
      $_aliasNameGenerator(db.reducedFromVault.vaultId, db.vault.id));

  $$VaultTableProcessedTableManager get vaultId {
    final $_column = $_itemColumn<int>('vault_id')!;

    final manager = $$VaultTableTableManager($_db, $_db.vault)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vaultIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ReducedFromVaultTableFilterComposer
    extends Composer<_$AppDatabase, $ReducedFromVaultTable> {
  $$ReducedFromVaultTableFilterComposer({
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

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  $$VaultTableFilterComposer get vaultId {
    final $$VaultTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaultId,
        referencedTable: $db.vault,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaultTableFilterComposer(
              $db: $db,
              $table: $db.vault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReducedFromVaultTableOrderingComposer
    extends Composer<_$AppDatabase, $ReducedFromVaultTable> {
  $$ReducedFromVaultTableOrderingComposer({
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

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  $$VaultTableOrderingComposer get vaultId {
    final $$VaultTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaultId,
        referencedTable: $db.vault,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaultTableOrderingComposer(
              $db: $db,
              $table: $db.vault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReducedFromVaultTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReducedFromVaultTable> {
  $$ReducedFromVaultTableAnnotationComposer({
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  $$VaultTableAnnotationComposer get vaultId {
    final $$VaultTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.vaultId,
        referencedTable: $db.vault,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$VaultTableAnnotationComposer(
              $db: $db,
              $table: $db.vault,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReducedFromVaultTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReducedFromVaultTable,
    ReducedFromVaultModel,
    $$ReducedFromVaultTableFilterComposer,
    $$ReducedFromVaultTableOrderingComposer,
    $$ReducedFromVaultTableAnnotationComposer,
    $$ReducedFromVaultTableCreateCompanionBuilder,
    $$ReducedFromVaultTableUpdateCompanionBuilder,
    (ReducedFromVaultModel, $$ReducedFromVaultTableReferences),
    ReducedFromVaultModel,
    PrefetchHooks Function({bool vaultId})> {
  $$ReducedFromVaultTableTableManager(
      _$AppDatabase db, $ReducedFromVaultTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReducedFromVaultTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReducedFromVaultTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReducedFromVaultTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> vaultId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> note = const Value.absent(),
          }) =>
              ReducedFromVaultCompanion(
            id: id,
            date: date,
            vaultId: vaultId,
            amount: amount,
            description: description,
            note: note,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            required int vaultId,
            required double amount,
            required String description,
            Value<String?> note = const Value.absent(),
          }) =>
              ReducedFromVaultCompanion.insert(
            id: id,
            date: date,
            vaultId: vaultId,
            amount: amount,
            description: description,
            note: note,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReducedFromVaultTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({vaultId = false}) {
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
                if (vaultId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.vaultId,
                    referencedTable:
                        $$ReducedFromVaultTableReferences._vaultIdTable(db),
                    referencedColumn:
                        $$ReducedFromVaultTableReferences._vaultIdTable(db).id,
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

typedef $$ReducedFromVaultTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReducedFromVaultTable,
    ReducedFromVaultModel,
    $$ReducedFromVaultTableFilterComposer,
    $$ReducedFromVaultTableOrderingComposer,
    $$ReducedFromVaultTableAnnotationComposer,
    $$ReducedFromVaultTableCreateCompanionBuilder,
    $$ReducedFromVaultTableUpdateCompanionBuilder,
    (ReducedFromVaultModel, $$ReducedFromVaultTableReferences),
    ReducedFromVaultModel,
    PrefetchHooks Function({bool vaultId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$SellReceiptsTableTableManager get sellReceipts =>
      $$SellReceiptsTableTableManager(_db, _db.sellReceipts);
  $$SellReceiptItemsTableTableManager get sellReceiptItems =>
      $$SellReceiptItemsTableTableManager(_db, _db.sellReceiptItems);
  $$SellPaymentsTableTableManager get sellPayments =>
      $$SellPaymentsTableTableManager(_db, _db.sellPayments);
  $$BuyReceiptsTableTableManager get buyReceipts =>
      $$BuyReceiptsTableTableManager(_db, _db.buyReceipts);
  $$BuyReceiptItemsTableTableManager get buyReceiptItems =>
      $$BuyReceiptItemsTableTableManager(_db, _db.buyReceiptItems);
  $$BuyPaymentsTableTableManager get buyPayments =>
      $$BuyPaymentsTableTableManager(_db, _db.buyPayments);
  $$ReturnReceiptsTableTableManager get returnReceipts =>
      $$ReturnReceiptsTableTableManager(_db, _db.returnReceipts);
  $$ReturnReceiptItemsTableTableManager get returnReceiptItems =>
      $$ReturnReceiptItemsTableTableManager(_db, _db.returnReceiptItems);
  $$ReturnPaymentsTableTableManager get returnPayments =>
      $$ReturnPaymentsTableTableManager(_db, _db.returnPayments);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$VaultTableTableManager get vault =>
      $$VaultTableTableManager(_db, _db.vault);
  $$AddedToVaultTableTableManager get addedToVault =>
      $$AddedToVaultTableTableManager(_db, _db.addedToVault);
  $$ReducedFromVaultTableTableManager get reducedFromVault =>
      $$ReducedFromVaultTableTableManager(_db, _db.reducedFromVault);
}
