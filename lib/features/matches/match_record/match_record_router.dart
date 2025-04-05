import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';

abstract class MatchRecordRoutes {
  static const String matchRecordPath = 'record';
  static final GoRoute route = GoRoute(
    path: matchRecordPath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.matchRecordFactory
          .createMatchRecordPage();
    },
  );
}
