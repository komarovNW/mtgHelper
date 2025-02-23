import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/drawer.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/features/score/components/alert.dart';
import 'package:mtg_helper/features/score/components/player_count.dart';
import 'package:mtg_helper/features/score/components/reset.dart';
import 'score_cubit.dart';
import 'score_state.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          context.l10n.scoreTitle,
        ),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScoreCubit, ScoreState>(
      listener: (BuildContext context, ScoreState state) {
        if (state.showResetDialog) {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return Alert(
                close: context.read<ScoreCubit>().closeDialog,
                reset: context.read<ScoreCubit>().reset,
              );
            },
          );
        }
      },
      builder: (BuildContext context, ScoreState state) {
        return Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                PlayerCount(
                  score: state.player1Health,
                  color: Colors.blue,
                  onIncrement: context.read<ScoreCubit>().incrementPlayer1,
                  onDecrement: context.read<ScoreCubit>().decrementPlayer1,
                ),
                PlayerCount(
                  score: state.player2Health,
                  color: Colors.red,
                  onIncrement: context.read<ScoreCubit>().incrementPlayer2,
                  onDecrement: context.read<ScoreCubit>().decrementPlayer2,
                ),
              ],
            ),
            Reset(
              reset: context.read<ScoreCubit>().requestReset,
            ),
          ],
        );
      },
    );
  }
}
