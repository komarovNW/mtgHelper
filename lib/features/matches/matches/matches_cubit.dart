import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/domain/use_cases/match/get_matches_use_case.dart';
import 'package:mtg_helper/features/matches/matches/matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesCubit({
    required GetMatchesUseCase getMatchesUseCase,
  })  : _getMatchesUseCase = getMatchesUseCase,
        // super(const MatchesState.loading());
        super(const MatchesState.success(<MatchModel>[]));
// ignore: unused_field
  final GetMatchesUseCase _getMatchesUseCase;

  Future<void> initProcess() async {}
}
