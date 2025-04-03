import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/match.dart';

part 'matches_state.freezed.dart';

@freezed
class MatchesState with _$MatchesState {
  const factory MatchesState.loading() = MatchesLoading;
  const factory MatchesState.success(List<MatchModel> allMatches) =
      MatchesSuccess;
  const factory MatchesState.failure(String error) = MatchesFailure;
}
