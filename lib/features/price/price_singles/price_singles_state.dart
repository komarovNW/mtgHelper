import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';

part 'price_singles_state.freezed.dart';

@freezed
class PriceSinglesState with _$PriceSinglesState {
  const factory PriceSinglesState.loading() = PriceSinglesLoading;
  const factory PriceSinglesState.success({
    required List<SinglesCardModel> list,
  }) = PriceSinglesSuccess;
  const factory PriceSinglesState.failure(String error) = PriceSinglesFailure;
}
