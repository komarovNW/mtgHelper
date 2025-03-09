import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';

import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/price/get_scg_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_state.dart';
import 'package:mtg_helper/utils/error.handler.dart';

class PriceSCGCubit extends Cubit<PriceSCGState> {
  PriceSCGCubit({
    required GetPriceSCGCardUseCase getPriceSCGCardUseCase,
    required SearchCardModel searchCard,
  })  : _getPriceSCGCardUseCase = getPriceSCGCardUseCase,
        _searchCard = searchCard,
        super(const PriceSCGState.loading());

  final GetPriceSCGCardUseCase _getPriceSCGCardUseCase;
  final SearchCardModel _searchCard;

  void loadPrice() async {
    try {
      final List<ScgCardsModel> list =
          await _getPriceSCGCardUseCase(_searchCard.name);
      emit(
        PriceSCGState.success(
          list: List<ScgCardsModel>.of(list),
        ),
      );
    } catch (e) {
      ErrorHandler.handleError(e, (String errorMessage) {
        emit(PriceSCGState.failure(errorMessage));
      });
    }
  }
}
