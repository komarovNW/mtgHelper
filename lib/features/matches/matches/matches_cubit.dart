import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/domain/use_cases/match/delete_match_use_case.dart';
import 'package:mtg_helper/domain/use_cases/match/get_matches_use_case.dart';
import 'package:mtg_helper/features/matches/matches/matches_state.dart';
import 'package:mtg_helper/utils/error.handler.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesCubit({
    required GetMatchesUseCase getMatchesUseCase,
    required DeleteMatchUseCase deleteMatchUseCase,
  })  : _getMatchesUseCase = getMatchesUseCase,
        _deleteMatchUseCase = deleteMatchUseCase,
        super(const MatchesState.loading());
  final GetMatchesUseCase _getMatchesUseCase;
  final DeleteMatchUseCase _deleteMatchUseCase;

  List<MatchModel> allMatches = <MatchModel>[];

  Future<void> initProcess() async {
    try {
      allMatches = await _getMatchesUseCase();
      emit(
        MatchesState.success(
          allMatches,
        ),
      );
    } catch (e) {
      ErrorHandler.handleError(e, (String errorMessage) {
        emit(MatchesState.failure(errorMessage));
      });
    }
  }

  void deleteMatch(String id) {
    allMatches.removeWhere((MatchModel element) => element.id == id);
    emit(
      MatchesState.success(
        allMatches,
      ),
    );
    _deleteMatchUseCase(id);
  }
}
