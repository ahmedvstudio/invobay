import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/router/router_constant.dart';
import 'package:invobay/core/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            spacing: 8,
            children: [
              SizedBox(height: VSizes.appBarHeight),
              TempButton(route: '/test'),
              TempButton(route: VRouter.login),
              TempButton(route: VRouter.signup),
              TempButton(route: VRouter.dashboard),
              TempButton(route: VRouter.inventory),
              TempButton(route: VRouter.purchases),
              TempButton(route: VRouter.sales),
              TempButton(route: VRouter.reports),
            ],
          ),
        ),
      ),
    );
  }
}

class TempButton extends StatelessWidget {
  const TempButton({
    super.key,
    required this.route,
  });
  final String route;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.pushNamed(route),
        child: Text(route),
      ),
    );
  }
}
