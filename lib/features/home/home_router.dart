import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:mtg_helper/features/home/home_page.dart';

abstract class HomeRoutes {
  static const String homePath = '/home';
  static final GoRoute route = GoRoute(
    path: homePath,
    builder: (BuildContext context, GoRouterState state) {
      return HomePage();
    },
  );
}
