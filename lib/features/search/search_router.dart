import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';

abstract class SearchRoutes {
  static const String searchPath = '/search';
  static final GoRoute route = GoRoute(
    path: searchPath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.searchFactory.createSearchPage();
    },
  );
}
