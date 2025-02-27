import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';

part 'price_state.freezed.dart';

@freezed
class PriceState with _$PriceState {
  const factory PriceState.initial() = PriceInitial;
  const factory PriceState.loading() = PriceLoading;
  const factory PriceState.success({
    required List<SearchCardModel> allCards,
  }) = PriceSuccess;
  const factory PriceState.failure(String error) = PriceFailure;
}
