import 'package:flutter/material.dart';
import 'package:invobay/screens/getting_started.dart';
import 'package:invobay/utils/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: InvoBay()));
}

class InvoBay extends StatelessWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InvoBay',
      themeMode: ThemeMode.system,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
      home: const GettingStarted(),
    );
  }
}
