import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/auth/auth_cubit.dart';
import 'package:mtg_helper/features/auth/auth_page.dart';

abstract class OnAuthRoutes {
  static const String onAuthPath = '/auth';
  static final GoRoute route = GoRoute(
    path: '/auth',
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<AuthCubit>.value(
        value: DependencyInjectionContainer.authFactory.createAuthCubit(),
        child: const AuthPage(),
      );
    },
  );
}
