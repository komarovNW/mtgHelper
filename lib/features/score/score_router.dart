import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';

abstract class ScoreRoutes {
  static const String scorePath = '/score';
  static final GoRoute route = GoRoute(
    path: scorePath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.scoreFactory.createScorePage();
    },
  );
}
