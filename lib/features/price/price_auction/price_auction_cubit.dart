import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/price/get_auction_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_auction/price_auction_state.dart';
import 'package:mtg_helper/utils/error.handler.dart';

class PriceAuctionCubit extends Cubit<PriceAuctionState> {
  PriceAuctionCubit({
    required GetPriceAuctionCardUseCase getPriceAuctionCardUseCase,
    required SearchCardModel searchCard,
  })  : _getPriceAuctionCardUseCase = getPriceAuctionCardUseCase,
        _searchCard = searchCard,
        super(const PriceAuctionState.loading()) {
    Future<void>.microtask(loadPrice);
  }

  final GetPriceAuctionCardUseCase _getPriceAuctionCardUseCase;
  final SearchCardModel _searchCard;

  void loadPrice() async {
    try {
      final AllAuctionsModel item = await _getPriceAuctionCardUseCase(
        _searchCard.name,
        _searchCard.localizedName,
      );
      emit(PriceAuctionState.success(item: item));
    } catch (e) {
      ErrorHandler.handleError(e, (String errorMessage) {
        emit(PriceAuctionState.failure(errorMessage));
      });
    }
  }
}
