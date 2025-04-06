import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/score/score_state.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreState.loading());

  late PlayerCount playerCount;

  void incrementPlayer(int playerIndex) {
    switch (playerIndex) {
      case 1:
        emit(
          state.copyWith(
            player1Health: state.player1Health + 1,
            showResetDialog: false,
          ),
        );
        break;
      case 2:
        emit(
          state.copyWith(
            player2Health: state.player2Health + 1,
            showResetDialog: false,
          ),
        );
        break;
      case 3:
        emit(
          state.copyWith(
            player3Health: state.player3Health + 1,
            showResetDialog: false,
          ),
        );
        break;
      case 4:
        emit(
          state.copyWith(
            player4Health: state.player4Health + 1,
            showResetDialog: false,
          ),
        );
        break;
    }
  }

  void decrementPlayer(int playerIndex) {
    switch (playerIndex) {
      case 1:
        emit(
          state.copyWith(
            player1Health: state.player1Health - 1,
            showResetDialog: false,
          ),
        );
        break;
      case 2:
        emit(
          state.copyWith(
            player2Health: state.player2Health - 1,
            showResetDialog: false,
          ),
        );
        break;
      case 3:
        emit(
          state.copyWith(
            player3Health: state.player3Health - 1,
            showResetDialog: false,
          ),
        );
        break;
      case 4:
        emit(
          state.copyWith(
            player4Health: state.player4Health - 1,
            showResetDialog: false,
          ),
        );
        break;
    }
  }

  void reset() {
    emit(
      state.copyWith(
        player1Health: playerCount.health,
        player2Health: playerCount.health,
        player3Health: playerCount.health,
        player4Health: playerCount.health,
        showResetDialog: false,
      ),
    );
  }

  void requestReset() => emit(state.copyWith(showResetDialog: true));

  void closeDialog() => emit(state.copyWith(showResetDialog: false));

  Future<void> initProcess(PlayerCount playerCount) async {
    playerCount = playerCount;
    emit(ScoreState.initial(playerCount));
  }
}
