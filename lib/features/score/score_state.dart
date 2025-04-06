import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';

part 'score_state.freezed.dart';

@freezed
class ScoreState with _$ScoreState {
  const factory ScoreState({
    required int player1Health,
    required int player2Health,
    required int player3Health,
    required int player4Health,
    PlayerCount? playerCount,
    @Default(false) bool showResetDialog,
  }) = _ScoreState;

  factory ScoreState.initial(PlayerCount playerCount) {
    return ScoreState(
      playerCount: playerCount,
      player1Health: playerCount.health,
      player2Health: playerCount.health,
      player3Health: playerCount.health,
      player4Health: playerCount.health,
    );
  }

  factory ScoreState.loading() {
    return const ScoreState(
      player1Health: 0,
      player2Health: 0,
      player3Health: 0,
      player4Health: 0,
    );
  }
}
