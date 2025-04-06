import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/domain/use_cases/auction/check_favotires_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_favorites_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/toggle_favorites_acution_use_case.dart';
import 'package:mtg_helper/domain/use_cases/price/get_auction_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_auction/price_auction_state.dart';
import 'package:mtg_helper/utils/error.handler.dart';

class PriceAuctionCubit extends Cubit<PriceAuctionState> {
  PriceAuctionCubit({
    required GetPriceAuctionCardUseCase getPriceAuctionCardUseCase,
    required ToggleFavoriteUseCase toggleFavoriteUseCase,
    required GetFavoritesIdsUseCase getFavoritesUseCase,
    required SearchCardModel searchCard,
    required CheckFavoritesAuctionsUseCase checkFavoritesAuctionsUseCase,
  })  : _getPriceAuctionCardUseCase = getPriceAuctionCardUseCase,
        _toggleFavoriteUseCase = toggleFavoriteUseCase,
        _getFavoritesIdsUseCase = getFavoritesUseCase,
        _checkFavoritesAuctionsUseCase = checkFavoritesAuctionsUseCase,
        _searchCard = searchCard,
        super(const PriceAuctionState.loading()) {
    Future<void>.microtask(loadPrice);
  }

  final GetPriceAuctionCardUseCase _getPriceAuctionCardUseCase;
  final SearchCardModel _searchCard;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  final GetFavoritesIdsUseCase _getFavoritesIdsUseCase;
  final CheckFavoritesAuctionsUseCase _checkFavoritesAuctionsUseCase;
  Set<String> _favoritesIds = <String>{};
  late final AllAuctionsModel item;

  void loadPrice() async {
    try {
      item = await _getPriceAuctionCardUseCase(
        _searchCard.name,
        _searchCard.localizedName,
      );
      await _checkFavoritesAuctionsUseCase(item.currentAuctions);
      _favoritesIds = (await _getFavoritesIdsUseCase()).toSet();
      emit(
        PriceAuctionState.success(
          item: item,
          favoritesIds: _favoritesIds,
        ),
      );
    } catch (e) {
      ErrorHandler.handleError(e, (String errorMessage) {
        emit(PriceAuctionState.failure(errorMessage));
      });
    }
  }

  Future<void> toggleFavorite(String auctionId) async {
    await _toggleFavoriteUseCase(auctionId);
    _favoritesIds = (await _getFavoritesIdsUseCase()).toSet();
    emit(
      PriceAuctionState.success(
        item: item,
        favoritesIds: _favoritesIds,
      ),
    );
  }
}
