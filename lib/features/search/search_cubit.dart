import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/search/get_search_cards_use_case.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required GetSearchCardsUseCase getListOfSearchCardsUseCase,
  })  : _getListOfSearchCardsUseCase = getListOfSearchCardsUseCase,
        super(const SearchState.initial());
  final GetSearchCardsUseCase _getListOfSearchCardsUseCase;

  List<SearchCardModel> _allCards = <SearchCardModel>[];

  Future<void> search(String query) async {
    emit(const SearchState.loading());
    try {
      _allCards = await _getListOfSearchCardsUseCase(query);
      emit(
        SearchState.success(
          allCards: List<SearchCardModel>.of(_allCards),
        ),
      );
    } catch (e) {
      emit(
        const SearchState.failure(''),
      );
    }
  }

  Future<void> reset() async {
    emit(const SearchState.initial());
  }
}
