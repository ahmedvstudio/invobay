import '../../database/hive/app_settings/app_settings.dart';

extension AppSettingsCopy on AppSettings {
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
