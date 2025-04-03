import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/matches/matches/matches_cubit.dart';
import 'package:mtg_helper/features/matches/matches/matches_page.dart';

abstract class MatchesRoutes {
  static const String matchesPath = '/matches';
  static final GoRoute route = GoRoute(
    path: matchesPath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<MatchesCubit>.value(
        value: DependencyInjectionContainer.matchesFactory.createMatchesCubit(),
        child: const MatchesPage(),
      );
    },
  );
}
