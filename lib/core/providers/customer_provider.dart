import 'package:flutter_riverpod/flutter_riverpod.dart';

// Holds the current customer name state
final customerNameProvider = StateProvider<String>((ref) => 'Walk-in Customer');

final customerPhoneProvider = StateProvider<String>((ref) => '+91 9876543210');

final customerAddressProvider =
    StateProvider<String>((ref) => 'South Liana, Maine 04028');
