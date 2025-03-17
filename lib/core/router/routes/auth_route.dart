import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/features/auth/login/login_screen.dart';
import 'package:invobay/features/auth/signup/signup_screen.dart';
import 'package:invobay/features/auth/password_config/forget_password.dart';
import 'package:invobay/features/auth/password_config/reset_password.dart';
import 'package:invobay/core/router/router_constant.dart';

List<GoRoute> authRoutes = [
  GoRoute(
    name: VRouter.login,
    path: '/login',
    builder: (context, state) => const LoginScreen(),
    routes: <RouteBase>[
      GoRoute(
        name: VRouter.forgetPass,
        path: '/forgetPassword',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ForgetPassword()),
      ),
      GoRoute(
        name: VRouter.resetPass,
        path: '/resetPassword',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ResetPassword()),
      ),
    ],
  ),
  GoRoute(
    name: VRouter.signup,
    path: '/signup',
    builder: (context, state) => const SignupScreen(),
  ),
];
