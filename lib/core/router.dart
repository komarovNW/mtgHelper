import 'package:go_router/go_router.dart';
import 'package:mtg_helper/features/auth/auth_router.dart';
import 'package:mtg_helper/features/home/home_router.dart';
import 'package:mtg_helper/features/onboarding/onboarding_router.dart';
import 'auth_notifier.dart';

final AuthNotifier _authNotifier = AuthNotifier();

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  refreshListenable: _authNotifier,
  initialLocation: OnboardingRoutes.onboardingPath,
  redirect: (_, GoRouterState state) {
    final bool isAuthenticated = _authNotifier.isAuthenticated;
    final bool isAtAuthOrOnboarding =
        state.matchedLocation == OnboardingRoutes.onboardingPath || state.matchedLocation == AuthRoutes.authPath;
    if (isAuthenticated && isAtAuthOrOnboarding) return HomeRoutes.homePath;
    if (!isAuthenticated && state.matchedLocation == HomeRoutes.homePath) {
      return OnboardingRoutes.onboardingPath;
    }
    return null;
  },
  routes: <RouteBase>[
    OnboardingRoutes.route,
    AuthRoutes.route,
    HomeRoutes.route,
  ],
);

// import 'package:go_router/go_router.dart';
//
// import 'package:mtg_helper/features/auth/auth_router.dart';
// import 'package:mtg_helper/features/home/home_router.dart';
// import 'package:mtg_helper/features/onboarding/onboarding_router.dart';
// import 'package:mtg_helper/core/auth_notifier.dart';
// import 'package:mtg_helper/data/repositories/user_repository_impl.dart';
//
// Future<GoRouter> createAppRouter() async {
//   final UserRepositoryImpl userRepository = UserRepositoryImpl();
//   final AuthNotifier authNotifier = AuthNotifier(userRepository);
//
//   return GoRouter(
//     debugLogDiagnostics: true,
//     refreshListenable: authNotifier,
//     initialLocation: OnboardingRoutes.onboardingPath,
//     redirect: (_, GoRouterState state) {
//       final bool isAuthenticated = authNotifier.isAuthenticated;
//       final bool isAtAuthOrOnboarding =
//           state.matchedLocation == OnboardingRoutes.onboardingPath || state.matchedLocation == AuthRoutes.authPath;
//       if (isAuthenticated && isAtAuthOrOnboarding) return HomeRoutes.homePath;
//       if (!isAuthenticated && state.matchedLocation == HomeRoutes.homePath) {
//         return OnboardingRoutes.onboardingPath;
//       }
//       return null;
//     },
//     routes: <RouteBase>[
//       OnboardingRoutes.route,
//       AuthRoutes.route,
//       HomeRoutes.route,
//     ],
//   );
// }
