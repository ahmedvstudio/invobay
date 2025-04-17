import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/invobay.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import 'core/database/hive/shop_details/shop_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// --> init Hive
  await Hive.initFlutter();

  Hive.registerAdapter(ShopDetailAdapter());
  runApp(
    const ProviderScope(
      child: InvoBay(),
    ),
  );
}
