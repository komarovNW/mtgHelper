import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/auction_model.dart';

part 'auctions_state.freezed.dart';

@freezed
class AuctionsState with _$AuctionsState {
  const factory AuctionsState.loading() = AuctionsLoading;

  const factory AuctionsState.success({
    required List<AuctionModel> allAuctions,
  }) = AuctionsSuccess;

  const factory AuctionsState.failure(String error) = AuctionsFailure;
}
