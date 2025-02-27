import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/price/get_use_case.dart';
import 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  PriceCubit({
    required GetUseCase getUseCase,
  })  : _getUseCase = getUseCase,
        super(const PriceState.initial());
  final GetUseCase _getUseCase;

  List<SearchCardModel> _allCards = <SearchCardModel>[];

  Future<void> search(String query) async {
    emit(const PriceState.loading());
    _allCards = await _getUseCase(query);
    emit(
      PriceState.success(
        allCards: List<SearchCardModel>.of(_allCards),
      ),
    );
  }

  Future<void> reset() async {
    emit(const PriceState.initial());
  }
}
