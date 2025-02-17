import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';
import 'package:mtg_helper/features/onboarding/onboarding_page.dart';

abstract class OnboardingRoutes {
  static const String onboardingPath = '/';
  static final GoRoute route = GoRoute(
    path: onboardingPath,
    builder: (BuildContext context, GoRouterState state) {
      return const OnboardingPage();
    },
  );
}
