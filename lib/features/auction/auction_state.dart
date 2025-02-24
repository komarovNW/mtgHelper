import 'package:freezed_annotation/freezed_annotation.dart';

part 'auction_state.freezed.dart';

@freezed
class AuctionState with _$AuctionState {
  const factory AuctionState.loading() = AuctionLoading;

  const factory AuctionState.success({
    // required List<Map<String, dynamic>> visibleAuctions,
    required List<Map<String, dynamic>> allAuctions,
    required bool hasMore,
  }) = AuctionSuccess;

  const factory AuctionState.failure(String error) = AuctionFailure;
}
