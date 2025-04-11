import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'default_providers.dart';

void resetProviders(WidgetRef ref) {
  // Reset Discount Providers
  ref.read(discountProvider.notifier).state = 0.0;
  ref.read(discountAppliedProvider.notifier).state = false;

  // Reset Shipping and Tax Fees
  ref.read(shippingFeeProvider.notifier).state = 0.0;
  ref.read(taxFeeProvider.notifier).state = 0.0;

  // Reset Customer Details Providers
  ref.read(customerNameProvider.notifier).state = '';
  ref.read(customerIDProvider.notifier).state = 0;
  ref.read(customerPhoneProvider.notifier).state = '';
  ref.read(customerAddressProvider.notifier).state = '';
}
