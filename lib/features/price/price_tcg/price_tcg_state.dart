import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/scryfall_card_model.dart';

part 'price_tcg_state.freezed.dart';

@freezed
class PriceTCGState with _$PriceTCGState {
  const factory PriceTCGState.loading() = PriceTCGLoading;
  const factory PriceTCGState.success({
    required List<ScryfallCardModel> list,
  }) = PriceTCGSuccess;
  const factory PriceTCGState.failure(String error) = PriceTCGFailure;
}
