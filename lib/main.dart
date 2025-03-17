import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invobay/invobay.dart';

void main() {
  runApp(
    const ProviderScope(
      child: InvoBay(),
    ),
  );
}
