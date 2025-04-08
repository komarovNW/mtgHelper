import 'package:flutter/material.dart';
import 'package:mtg_helper/utils/enums/format.dart';
import 'package:mtg_helper/utils/loggable_model.dart';

class MatchModel extends LoggableModel {
  factory MatchModel.fromJson(Map<String, dynamic> json) {
    try {
      final int seconds = (json['date']['_seconds'] as int);
      final int nanoseconds = (json['date']['_nanoseconds'] as int);
      final DateTime date = DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + (nanoseconds ~/ 1000000),
      );

      return MatchModel(
        id: json['id'] as String?,
        playerDeck: json['playerDeck'] as String,
        opponentDeck: json['opponentDeck'] as String,
        date: date,
        format: Format.values.firstWhere(
          (Format f) => f.name == json['format'],
          orElse: () => Format.other,
        ),
        opponentName: json['opponentName'] as String?,
        isOnPlay: json['isOnPlay'] as bool,
        games: (json['games'] as List<dynamic>)
            .map((dynamic e) => Game.values.firstWhere((Game g) => g.name == e))
            .toList(),
        comment: json['comment'] as String? ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('AuctionModel', json, e, stackTrace);
      return MatchModel(
        playerDeck: 'unknown',
        opponentDeck: 'unknown',
        date: DateTime.now(),
        format: Format.other,
        opponentName: 'unknown',
        isOnPlay: false,
        games: <Game>[],
        comment: 'unknown',
      );
    }
  }
  MatchModel({
    this.id,
    required this.playerDeck,
    required this.opponentDeck,
    required this.date,
    required this.format,
    this.opponentName,
    required this.isOnPlay,
    required this.games,
    this.comment,
  });
  final String? id;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'playerDeck': playerDeck,
      'opponentDeck': opponentDeck,
      'date': <String, int>{
        '_seconds': date.millisecondsSinceEpoch ~/ 1000,
        '_nanoseconds': (date.microsecondsSinceEpoch % 1000000) * 1000,
      },
      'format': format.name,
      'opponentName': opponentName,
      'isOnPlay': isOnPlay,
      'games': games.map((Game g) => g.name).toList(),
    };
  }

  final String playerDeck;
  final String opponentDeck;
  final DateTime date;
  final Format format;
  final String? opponentName;
  final bool isOnPlay;
  final List<Game> games;
  final String? comment;

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

  String get winScore {
    return games.where((Game game) => game == Game.win).length.toString();
  }

  String get lossScore {
    return games.where((Game game) => game == Game.loss).length.toString();
  }
}

enum MatchResult { win, loss, draw }

enum Game {
  win('🏆 Победа'),
  loss('💀 Поражение');

  const Game(this.text);
  final String text;
}
