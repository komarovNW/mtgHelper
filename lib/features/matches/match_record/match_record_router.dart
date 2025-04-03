import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_cubit.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_page.dart';

abstract class MatchRecordRoutes {
  static const String matchRecordPath = '/addMatch';
  static final GoRoute route = GoRoute(
    path: matchRecordPath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<MatchRecordCubit>.value(
        value: DependencyInjectionContainer.matchRecordFactory
            .createMatchRecordCubit(),
        child: const MatchRecordPage(),
      );
    },
  );
}
