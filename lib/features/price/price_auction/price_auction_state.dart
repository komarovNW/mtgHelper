import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';

part 'price_auction_state.freezed.dart';

@freezed
class PriceAuctionState with _$PriceAuctionState {
  const factory PriceAuctionState.loading() = PriceAuctionLoading;
  const factory PriceAuctionState.success({
    required AllAuctionsModel item,
  }) = PriceAuctionSuccess;
  const factory PriceAuctionState.failure(String error) = PriceAuctionFailure;
}
