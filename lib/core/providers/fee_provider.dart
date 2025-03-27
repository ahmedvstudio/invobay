import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers for shipping fee and tax fee

final shippingFeeProvider = StateProvider<double>((ref) => 0.6);
final taxFeeProvider = StateProvider<double>((ref) => 5.0);
