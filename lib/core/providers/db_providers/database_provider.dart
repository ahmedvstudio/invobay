import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../database/drift/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase.getInstance();
});
