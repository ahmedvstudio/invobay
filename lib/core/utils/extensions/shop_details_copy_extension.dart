import '../../database/hive/shop_details/shop_details.dart';

extension ShopDetailCopy on ShopDetail {
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
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      description: description ?? this.description,
      extraPhone: extraPhone ?? this.extraPhone,
    );
  }
}
