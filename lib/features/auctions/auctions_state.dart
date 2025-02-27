import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/domain/entities/auction.dart';

part 'auctions_state.freezed.dart';

@freezed
class AuctionsState with _$AuctionsState {
  const factory AuctionsState.loading() = AuctionsLoading;

  const factory AuctionsState.success({
    required List<Auction> allAuctions,
  }) = AuctionsSuccess;

  const factory AuctionsState.failure(String error) = AuctionsFailure;
}
