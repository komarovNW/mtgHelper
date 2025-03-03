import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scryfall_card_model.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/price/get_tcg_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_tcg/price_tcg_state.dart';

class PriceTCGCubit extends Cubit<PriceTCGState> {
  PriceTCGCubit({
    required GetPriceTCGCardUseCase getTCGPriceCardUseCase,
    required SearchCardModel searchCard,
  })  : _getTCGPriceCardUseCase = getTCGPriceCardUseCase,
        _searchCard = searchCard,
        super(const PriceTCGState.loading()) {
    Future<void>.microtask(loadPrice);
  }

  final GetPriceTCGCardUseCase _getTCGPriceCardUseCase;
  final SearchCardModel _searchCard;

  void loadPrice() async {
    try {
      final List<ScryfallCardModel> list =
          await _getTCGPriceCardUseCase(_searchCard.name);
      emit(PriceTCGState.success(list: list));
    } catch (e) {
      emit(const PriceTCGState.failure(''));
    }
  }
}
