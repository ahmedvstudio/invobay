// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopDetailAdapter extends TypeAdapter<ShopDetail> {
  @override
  final int typeId = 0;

  @override
  ShopDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShopDetail(
      name: fields[0] as String,
      phone: fields[1] as String,
      extraPhone: fields[2] as String,
      street: fields[3] as String,
      city: fields[4] as String,
      state: fields[5] as String,
      country: fields[6] as String,
      description: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ShopDetail obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.extraPhone)
      ..writeByte(3)
      ..write(obj.street)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
