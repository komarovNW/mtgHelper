import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/features/auth/auth_page.dart';
import 'package:mtg_helper/features/home/home_page.dart';
import 'package:mtg_helper/features/onboarding/onboarding_page.dart';
import 'notifier.dart';

final AuthNotifier _authNotifier = AuthNotifier();

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  refreshListenable: _authNotifier,
  initialLocation: '/',
  redirect: (_, GoRouterState state) {
    final bool isAuthenticated = _authNotifier.isAuthenticated;
    final bool isAtAuthOrOnboarding = state.matchedLocation == '/' || state.matchedLocation == '/auth';

    if (isAuthenticated && isAtAuthOrOnboarding) {
      return '/home';
    }

    if (!isAuthenticated && state.matchedLocation == '/home') {
      return '/';
    }

    return null;
  },
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (BuildContext context, GoRouterState state) => const OnboardingPage()),
    GoRoute(path: '/auth', builder: (BuildContext context, GoRouterState state) => AuthPage()),
    GoRoute(path: '/home', builder: (BuildContext context, GoRouterState state) => const HomePage()),
  ],
);
