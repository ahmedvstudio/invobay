// Provider for temporary quantity state
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProvider = StateProvider.autoDispose<String>((ref) => '');
