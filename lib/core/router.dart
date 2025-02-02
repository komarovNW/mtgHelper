import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_page.dart';
import '../features/onboarding/onboarding_page.dart';
import '../features/auth/auth_page.dart';
import 'notifier.dart';

final AuthNotifier authNotifier = AuthNotifier();

final GoRouter goRouter = GoRouter(
  refreshListenable: authNotifier,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return authNotifier.isAuthenticated ? const HomePage() : const OnboardingPage();
      },
    ),
    GoRoute(path: '/auth', builder: (BuildContext context, GoRouterState state) => AuthPage()),
    GoRoute(path: '/home', builder: (BuildContext context, GoRouterState state) => const HomePage()),
  ],
);
