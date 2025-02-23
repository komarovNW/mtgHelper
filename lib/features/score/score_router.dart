import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/score/score_cubit.dart';
import 'package:mtg_helper/features/score/score_page.dart';

abstract class ScoreRoutes {
  static const String scorePath = '/score';
  static final GoRoute route = GoRoute(
    path: scorePath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<ScoreCubit>.value(
        value: DependencyInjectionContainer.scoreFactory.createScoreCubit(),
        child: const ScorePage(),
      );
    },
  );
}
