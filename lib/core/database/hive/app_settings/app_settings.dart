import 'package:hive_ce/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 3)
class AppSettings extends HiveObject {
  @HiveField(0)
  String languageCode;

  @HiveField(1)
  double taxPercentage;

  @HiveField(2)
  int lowStockThreshold;

  @HiveField(3)
  String currencySign;

  AppSettings({
    required this.languageCode,
    required this.taxPercentage,
    required this.lowStockThreshold,
    required this.currencySign,
  });

  AppSettings copyWith({
    String? currencySign,
    double? taxPercentage,
    int? lowStockThreshold,
    String? languageCode,
  }) {
    return AppSettings(
      currencySign: currencySign ?? this.currencySign,
      taxPercentage: taxPercentage ?? this.taxPercentage,
      lowStockThreshold: lowStockThreshold ?? this.lowStockThreshold,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}
