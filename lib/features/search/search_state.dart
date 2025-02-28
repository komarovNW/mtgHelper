import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchInitial;
  const factory SearchState.loading() = SearchLoading;
  const factory SearchState.success({
    required List<SearchCardModel> allCards,
  }) = SearchSuccess;
  const factory SearchState.failure(String error) = SearchFailure;
}
