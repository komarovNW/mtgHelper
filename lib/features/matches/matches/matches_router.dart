import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_router.dart';

abstract class MatchesRoutes {
  static const String matchesPath = '/matches';
  static final GoRoute route = GoRoute(
    path: matchesPath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.matchesFactory.createMatchesPage();
    },
    routes: <RouteBase>[
      MatchRecordRoutes.route,
    ],
  );
}
