import 'package:hive_ce/hive.dart';

part 'shop_details.g.dart';

@HiveType(typeId: 0)
class ShopDetail extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String extraPhone;

  @HiveField(3)
  String street;

  @HiveField(4)
  String city;

  @HiveField(5)
  String state;

  @HiveField(6)
  String country;

  @HiveField(7)
  String description;

  ShopDetail({
    required this.name,
    required this.phone,
    required this.extraPhone,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.description,
  });

  ShopDetail copyWith({
    String? name,
    String? phone,
    String? extraPhone,
    String? street,
    String? city,
    String? state,
    String? country,
    String? description,
  }) {
    return ShopDetail(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      extraPhone: extraPhone ?? this.extraPhone,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      description: description ?? this.description,
    );
  }
}
