import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/price/get_scg_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_state.dart';

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
    final List<SCGCardModel> list =
        await _getPriceSCGCardUseCase(_searchCard.text);
    emit(
      PriceSCGState.success(
        list: List<SCGCardModel>.of(list),
      ),
    );
  }
}
