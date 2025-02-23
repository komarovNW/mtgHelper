import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/score/score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreState.initial());

  void incrementPlayer1() => emit(
        state.copyWith(
          player1Health: state.player1Health + 1,
          showResetDialog: false,
        ),
      );

  void decrementPlayer1() => emit(
        state.copyWith(
          player1Health: state.player1Health - 1,
          showResetDialog: false,
        ),
      );

  void incrementPlayer2() => emit(
        state.copyWith(
          player2Health: state.player2Health + 1,
          showResetDialog: false,
        ),
      );

  void decrementPlayer2() => emit(
        state.copyWith(
          player2Health: state.player2Health - 1,
          showResetDialog: false,
        ),
      );

  void reset() => emit(
        state.copyWith(
          player1Health: 20,
          player2Health: 20,
          showResetDialog: false,
        ),
      );

  void requestReset() => emit(
        state.copyWith(
          showResetDialog: true,
        ),
      );

  void closeDialog() => emit(
        state.copyWith(
          showResetDialog: false,
        ),
      );
}
