import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/core/database/hive/hive_registrar.dart';
import 'package:invobay/invobay.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// --> init Hive
  await Hive.initFlutter();
  Hive.registerAdapters();

  runApp(
    const ProviderScope(
      child: InvoBay(),
    ),
  );
}
