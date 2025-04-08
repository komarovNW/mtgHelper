import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/domain/use_cases/match/add_match_use_case.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_state.dart';

class MatchRecordCubit extends Cubit<MatchRecordState> {
  MatchRecordCubit({required AddMatchUseCase matchRecordUseCase})
      : _matchRecordUseCase = matchRecordUseCase,
        super(const MatchRecordState());

  final AddMatchUseCase _matchRecordUseCase;

  Future<void> validateForm({required MatchModel match}) async {
    final ValidationErrors errors = _validateInputs(match);
    if (errors.hasErrors) {
      _resetStatus(validationErrors: errors);
      return;
    }
    _resetStatus();
    emit(state.copyWith(isSubmitting: true));
    try {
      await _matchRecordUseCase(match);

      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
        ),
      );
    }
  }

  ValidationErrors _validateInputs(
    MatchModel match,
  ) {
    return ValidationErrors(
      deckNameError: match.playerDeck.isNotEmpty ? null : 'Обязательно',
      deckNameOpponentError:
          match.opponentDeck.isNotEmpty ? null : 'Обязательно',
    );
  }

  void _resetStatus({ValidationErrors? validationErrors}) {
    emit(
      state.copyWith(
        isSubmitting: false,
        isSuccess: false,
        validationErrors: validationErrors ?? const ValidationErrors(),
      ),
    );
  }
}
