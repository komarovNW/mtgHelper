import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_state.freezed.dart';

@freezed
class ScoreState with _$ScoreState {
  const factory ScoreState({
    required int player1Health,
    required int player2Health,
    @Default(false) bool showResetDialog,
  }) = _ScoreState;

  factory ScoreState.initial() => const ScoreState(
        player1Health: 20,
        player2Health: 20,
      );
}
