import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../db_providers/hive_providers/app_settings_provider.dart';
import 'default_providers.dart';

void resetProviders(WidgetRef ref) {
  // Reset Discount Providers
  ref.read(discountProvider.notifier).state = 0.0;
  ref.read(discountAppliedProvider.notifier).state = false;

  // Reset Shipping Fees
  ref.read(shippingFeeProvider.notifier).state = 0.0;

  // Reset Tax Fees
  final currentTax = ref.watch(appSettingsProvider).value?.taxPercentage ?? 0.0;
  ref.read(taxFeeProvider.notifier).resetToDefault(currentTax);

  // Reset Customer Details Providers
  ref.read(customerNameProvider.notifier).state = '';
  ref.read(customerIDProvider.notifier).state = 0;
  ref.read(customerPhoneProvider.notifier).state = '';
  ref.read(customerAddressProvider.notifier).state = '';

  // Reset Supplier Details Providers
  ref.read(supplierNameProvider.notifier).state = '';
  ref.read(supplierIDProvider.notifier).state = 0;
  ref.read(supplierPhoneProvider.notifier).state = '';
  ref.read(supplierAddressProvider.notifier).state = '';
}
