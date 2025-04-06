import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';

abstract class CalendarRoutes {
  static const String calendarPath = '/calendar';
  static final GoRoute route = GoRoute(
    path: calendarPath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.calendarFactory
          .createCalendarBlocProvider();
    },
  );
}
