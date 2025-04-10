import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';

abstract class AuthRoutes {
  static const String authPath = '/auth';
  static final GoRoute route = GoRoute(
    path: authPath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.authFactory.createAuthBlocProvider();
    },
  );
}
