import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/score/score_cubit.dart';
import 'package:mtg_helper/features/score/score_page.dart';

class ScoreFactory {
  ScoreFactory();

  ScoreCubit createScoreCubit() {
    return ScoreCubit();
  }

  Widget createScorePage() {
    return BlocProvider<ScoreCubit>(
      create: (_) => createScoreCubit(),
      child: const ScorePage(),
    );
  }
}
