import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for temporary quantity state
final quantityProvider = StateProvider.autoDispose<String>((ref) => '');
