import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
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
      drawer: AppDrawer(currentPage: context.l10n.drawerScore),
      appBar: CustomAppBar(
        title: TitleWidget(
          title: context.l10n.scoreTitle,
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
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final PlayerCount playerCount =
        context.watch<PlayerCountNotifier>().playerCount;
    context.read<ScoreCubit>().initProcess(playerCount);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
    ]);
  }

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
        if (state == ScoreState.loading()) {
          return const SizedBox.expand();
        }

        return Stack(
          children: <Widget>[
            _PlayerCountLayout(
              playerCount: state.playerCount!,
              state: state,
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

class _PlayerCountLayout extends StatelessWidget {
  const _PlayerCountLayout({
    required this.playerCount,
    required this.state,
  });

  final PlayerCount playerCount;
  final ScoreState state;

  @override
  Widget build(BuildContext context) {
    return playerCount == PlayerCount.two
        ? _TwoPlayerCount(state: state)
        : _FourPlayerCount(state: state);
  }
}

class _TwoPlayerCount extends StatelessWidget {
  const _TwoPlayerCount({required this.state});

  final ScoreState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlayerCountWidget(
          score: state.player1Health,
          color: const Color(0xff2d7dd2),
          onIncrement: () => context.read<ScoreCubit>().incrementPlayer(1),
          onDecrement: () => context.read<ScoreCubit>().decrementPlayer(1),
        ),
        PlayerCountWidget(
          score: state.player2Health,
          color: const Color(0xfff45d01),
          onIncrement: () => context.read<ScoreCubit>().incrementPlayer(2),
          onDecrement: () => context.read<ScoreCubit>().decrementPlayer(2),
        ),
      ],
    );
  }
}

class _FourPlayerCount extends StatelessWidget {
  const _FourPlayerCount({required this.state});

  final ScoreState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _PlayerColumn(
            player1Score: state.player1Health,
            player2Score: state.player2Health,
            player1Increment: () =>
                context.read<ScoreCubit>().incrementPlayer(1),
            player1Decrement: () =>
                context.read<ScoreCubit>().decrementPlayer(1),
            player2Increment: () =>
                context.read<ScoreCubit>().incrementPlayer(2),
            player2Decrement: () =>
                context.read<ScoreCubit>().decrementPlayer(2),
            player1Color: const Color(0xff2d7dd2),
            player2Color: const Color(0xfff45d01),
          ),
        ),
        Expanded(
          child: _PlayerColumn(
            player1Score: state.player3Health,
            player2Score: state.player4Health,
            player1Increment: () =>
                context.read<ScoreCubit>().incrementPlayer(3),
            player1Decrement: () =>
                context.read<ScoreCubit>().decrementPlayer(3),
            player2Increment: () =>
                context.read<ScoreCubit>().incrementPlayer(4),
            player2Decrement: () =>
                context.read<ScoreCubit>().decrementPlayer(4),
            player1Color: const Color(0xff28a745),
            player2Color: const Color(0xff6f42c1),
          ),
        ),
      ],
    );
  }
}

class _PlayerColumn extends StatelessWidget {
  const _PlayerColumn({
    required this.player1Score,
    required this.player2Score,
    required this.player1Increment,
    required this.player1Decrement,
    required this.player2Increment,
    required this.player2Decrement,
    required this.player1Color,
    required this.player2Color,
  });

  final int player1Score;
  final int player2Score;
  final VoidCallback player1Increment;
  final VoidCallback player1Decrement;
  final VoidCallback player2Increment;
  final VoidCallback player2Decrement;
  final Color player1Color;
  final Color player2Color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlayerCountWidget(
          score: player1Score,
          color: player1Color,
          onIncrement: player1Increment,
          onDecrement: player1Decrement,
        ),
        PlayerCountWidget(
          score: player2Score,
          color: player2Color,
          onIncrement: player2Increment,
          onDecrement: player2Decrement,
        ),
      ],
    );
  }
}
