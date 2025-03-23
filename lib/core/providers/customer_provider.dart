import 'package:flutter_riverpod/flutter_riverpod.dart';

// Holds the current customer name state
final customerNameProvider = StateProvider<String>((ref) => 'Walk-in Customer');
