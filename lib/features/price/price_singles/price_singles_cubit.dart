import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/domain/use_cases/price/get_singles_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_state.dart';
import 'package:mtg_helper/utils/error.handler.dart';

class PriceSinglesCubit extends Cubit<PriceSinglesState> {
  PriceSinglesCubit({
    required GetPriceSinglesCardUseCase getPriceSinglesCardUseCase,
    required SearchCardModel searchCard,
  })  : _getPriceSinglesCardUseCase = getPriceSinglesCardUseCase,
        _searchCard = searchCard,
        super(const PriceSinglesState.loading()) {
    Future<void>.microtask(loadPrice);
  }

  final GetPriceSinglesCardUseCase _getPriceSinglesCardUseCase;
  final SearchCardModel _searchCard;

  void loadPrice() async {
    try {
      final List<SinglesCardModel> list = await _getPriceSinglesCardUseCase(
        _searchCard.name,
        _searchCard.localizedName,
      );
      emit(PriceSinglesState.success(list: list));
    } catch (e) {
      ErrorHandler.handleError(e, (String errorMessage) {
        emit(PriceSinglesState.failure(errorMessage));
      });
    }
  }
}
