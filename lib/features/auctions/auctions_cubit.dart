import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/domain/use_cases/auction/check_favotires_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/filter_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_favorites_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/toggle_favorites_acution_use_case.dart';
import 'package:mtg_helper/features/auctions/auctions_state.dart';
import 'package:mtg_helper/utils/error.handler.dart';

class AuctionsCubit extends Cubit<AuctionsState> {
  AuctionsCubit({
    required GetAuctionsUseCase getAuctionsUseCase,
    required GetFavoritesIdsUseCase getFavoritesUseCase,
    required ToggleFavoriteUseCase toggleFavoriteUseCase,
    required FilterUseCase filterUseCase,
    required CheckFavoritesAuctionsUseCase checkFavoritesAuctionsUseCase,
  })  : _getAuctionsUseCase = getAuctionsUseCase,
        _filterUseCase = filterUseCase,
        _getFavoritesIdsUseCase = getFavoritesUseCase,
        _toggleFavoriteUseCase = toggleFavoriteUseCase,
        _checkFavoritesAuctionsUseCase = checkFavoritesAuctionsUseCase,
        super(const AuctionsState.loading());
  final GetAuctionsUseCase _getAuctionsUseCase;
  final FilterUseCase _filterUseCase;
  final GetFavoritesIdsUseCase _getFavoritesIdsUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  final CheckFavoritesAuctionsUseCase _checkFavoritesAuctionsUseCase;

  List<AuctionModel> _allAuctions = <AuctionModel>[];
  Set<String> _favoritesIds = <String>{};

  Future<void> initProcess() async {
    emit(const AuctionsState.loading());
    try {
      _allAuctions = (await _getAuctionsUseCase()).reversed.toList();
      await _checkFavoritesAuctionsUseCase(_allAuctions);
      _favoritesIds = (await _getFavoritesIdsUseCase()).toSet();
      emit(
        AuctionsState.success(
          allAuctions: _allAuctions,
          favoritesIds: _favoritesIds,
          favoriteAuctions: _getFavoriteAuctions(),
        ),
      );
    } catch (e) {
      ErrorHandler.handleError(e, (String errorMessage) {
        emit(AuctionsState.failure(errorMessage));
      });
    }
  }

  Future<void> reset() async {
    emit(const AuctionsState.loading());
    emit(
      AuctionsState.success(
        allAuctions: _allAuctions,
        favoritesIds: _favoritesIds,
        favoriteAuctions: _getFavoriteAuctions(),
      ),
    );
  }

  Future<void> toggleFavorite(String auctionId) async {
    await _toggleFavoriteUseCase(auctionId);
    _favoritesIds = (await _getFavoritesIdsUseCase()).toSet();
    emit(
      AuctionsState.success(
        allAuctions: _allAuctions,
        favoritesIds: _favoritesIds,
        favoriteAuctions: _getFavoriteAuctions(),
      ),
    );
  }

  void filter(String query) {
    final List<AuctionModel> filtered = _filterUseCase(_allAuctions, query);
    emit(
      AuctionsState.success(
        allAuctions: List<AuctionModel>.of(filtered),
        favoritesIds: _favoritesIds,
        favoriteAuctions: _getFavoriteAuctions(),
      ),
    );
  }

  List<AuctionModel> _getFavoriteAuctions() {
    return _allAuctions
        .where((AuctionModel auction) => _favoritesIds.contains(auction.id))
        .toList();
  }
}
