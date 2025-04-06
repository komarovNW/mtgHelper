import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';

class PlayerCountWidget extends StatelessWidget {
  const PlayerCountWidget({
    super.key,
    required int score,
    required Color color,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  })  : _score = score,
        _color = color,
        _onIncrement = onIncrement,
        _onDecrement = onDecrement;

  final int _score;
  final Color _color;
  final VoidCallback _onIncrement;
  final VoidCallback _onDecrement;

  @override
  Widget build(BuildContext context) {
    final PlayerCount playerCount =
        context.watch<PlayerCountNotifier>().playerCount;
    return Expanded(
      child: Container(
        color: _color,
        child: Stack(
          children: <Widget>[
            playerCount == PlayerCount.two
                ? _HorizontalGestureArea(
                    onDecrement: _onDecrement,
                    onIncrement: _onIncrement,
                  )
                : _VerticalGestureArea(
                    onDecrement: _onDecrement,
                    onIncrement: _onIncrement,
                  ),
            playerCount == PlayerCount.two
                ? Center(
                    child: _ScoreText(score: _score),
                  )
                : Center(
                    child: Transform.rotate(
                      angle: 3.14159 / 2,
                      child: _ScoreText(score: _score),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalGestureArea extends StatelessWidget {
  const _HorizontalGestureArea({
    required this.onDecrement,
    required this.onIncrement,
  });
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _GestureDetectorContainer(onTap: onDecrement),
        _GestureDetectorContainer(onTap: onIncrement),
      ],
    );
  }
}

class _VerticalGestureArea extends StatelessWidget {
  const _VerticalGestureArea({
    required this.onDecrement,
    required this.onIncrement,
  });
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _GestureDetectorContainer(onTap: onDecrement),
        _GestureDetectorContainer(onTap: onIncrement),
      ],
    );
  }
}

class _GestureDetectorContainer extends StatelessWidget {
  const _GestureDetectorContainer({
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class _ScoreText extends StatelessWidget {
  const _ScoreText({
    required this.score,
  });
  final int score;

  @override
  Widget build(BuildContext context) {
    return Text(
      score.toString(),
      style: const TextStyle(
        fontSize: 68,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
