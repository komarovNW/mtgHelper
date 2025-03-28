import 'package:go_router/go_router.dart';
import 'package:mtg_helper/features/auctions/auctions_router.dart';
import 'package:mtg_helper/features/auth/auth_router.dart';
import 'package:mtg_helper/features/onboarding/onboarding_router.dart';
import 'package:mtg_helper/features/price/price_router.dart';
import 'package:mtg_helper/features/profile/profile_router.dart';
import 'package:mtg_helper/features/registration/registration_router.dart';
import 'package:mtg_helper/features/score/score_router.dart';
import 'package:mtg_helper/features/search/search_router.dart';
import '../utils/auth_notifier.dart';

final AuthNotifier _authNotifier = AuthNotifier();

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  refreshListenable: _authNotifier,
  initialLocation: OnboardingRoutes.onboardingPath,
  redirect: (_, GoRouterState state) {
    final bool isAuthenticated = _authNotifier.isAuthenticated;
    final bool isAtAuthOrOnboarding =
        state.matchedLocation == OnboardingRoutes.onboardingPath ||
            state.matchedLocation == AuthRoutes.authPath;
    // if (isAuthenticated && isAtAuthOrOnboarding) return HomeRoutes.homePath;
    if (isAuthenticated && isAtAuthOrOnboarding) return ScoreRoutes.scorePath;
    if (!isAuthenticated &&
        state.matchedLocation == ProfileRoutes.profilePath) {
      return OnboardingRoutes.onboardingPath;
    }
    return null;
  },
  routes: <RouteBase>[
    OnboardingRoutes.route,
    AuthRoutes.route,
    RegistrationRoutes.route,
    // HomeRoutes.route,
    ScoreRoutes.route,
    AuctionsRoutes.route,
    SearchRoutes.route,
    PriceRoutes.route,
    ProfileRoutes.route,
  ],
);
