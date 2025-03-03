import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';

part 'price_scg_state.freezed.dart';

@freezed
class PriceSCGState with _$PriceSCGState {
  const factory PriceSCGState.loading() = PriceSCGLoading;
  const factory PriceSCGState.success({
    required List<SCGCardModel> list,
  }) = PriceSCGSuccess;
  const factory PriceSCGState.failure(String error) = PriceSCGFailure;
}
