import 'package:hive_ce/hive.dart';

part 'shop_details.g.dart';

@HiveType(typeId: 0)
class ShopDetail extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phone;

  @HiveField(2)
  String street;

  @HiveField(3)
  String city;

  @HiveField(4)
  String state;

  @HiveField(5)
  String country;

  @HiveField(6)
  String description;

  ShopDetail({
    required this.name,
    required this.phone,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.description,
  });
}
