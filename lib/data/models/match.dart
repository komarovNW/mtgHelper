import 'package:flutter/material.dart';

class MatchModel {
  MatchModel({
    required this.playerDeck,
    required this.opponentDeck,
    required this.date,
    required this.format,
    this.opponentName,
    required this.isOnPlay,
    required this.games,
  });

  final String playerDeck;
  final String opponentDeck;
  final DateTime date;
  final Format format;
  final String? opponentName;
  final bool isOnPlay;
  final List<Game> games;

  MatchResult get matchResult {
    return games.fold(0, (int acc, Game g) => acc + (g == Game.win ? 1 : -1)) >
            0
        ? MatchResult.win
        : games.fold(0, (int acc, Game g) => acc + (g == Game.win ? 1 : -1)) < 0
            ? MatchResult.loss
            : MatchResult.draw;
  }

  Color get backgroundColor {
    switch (matchResult) {
      case MatchResult.win:
        return Colors.green;
      case MatchResult.loss:
        return Colors.red;
      case MatchResult.draw:
        return const Color(0xffffba58);
    }
  }
}

enum MatchResult { win, loss, draw }

enum Format {
  pioneer,
  standart,
  modern,
  legacy,
  other,
}

enum Game {
  win('🏆 Победа'),
  loss('💀 Поражение');

  const Game(this.text);
  final String text;
}
