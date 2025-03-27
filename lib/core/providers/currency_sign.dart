import 'package:flutter_riverpod/flutter_riverpod.dart';

// Holds the current currency
final currencySignProvider = StateProvider<String>((ref) => '\$');
