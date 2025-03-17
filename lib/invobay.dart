import 'package:flutter/material.dart';
import 'package:invobay/core/database/app_database.dart';
import 'package:invobay/core/repository/item_dao.dart';
import 'package:invobay/core/providers/item_provider.dart';
import 'package:invobay/core/router/app_router.dart';
import 'package:provider/provider.dart';

import 'theme/theme.dart';

class InvoBay extends StatelessWidget {
  const InvoBay({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase.getInstance();
    final itemDao = ItemDao(database);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ItemProvider(itemDao)..fetchItems()),
      ],
      child: MaterialApp.router(
        title: 'InvoBay',
        routerConfig: invoRouter,
        themeMode: ThemeMode.system,
        theme: VAppTheme.lightTheme,
        darkTheme: VAppTheme.darkTheme,
      ),
    );
  }
}
