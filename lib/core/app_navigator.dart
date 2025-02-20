import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/features/auth/auth_router.dart';
import 'package:mtg_helper/features/home/home_router.dart';

class AppNavigator {
  static void goHome(BuildContext context) => context.go(HomeRoutes.homePath);
  static void goAuth(BuildContext context) => context.go(AuthRoutes.authPath);
}
