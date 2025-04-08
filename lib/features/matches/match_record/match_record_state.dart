import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_record_state.freezed.dart';

@freezed
class MatchRecordState with _$MatchRecordState {
  const factory MatchRecordState({
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @Default(ValidationErrors()) ValidationErrors validationErrors,
  }) = _MatchRecordState;
}

@freezed
class ValidationErrors with _$ValidationErrors {
  const factory ValidationErrors({
    String? deckNameError,
    String? deckNameOpponentError,
  }) = _ValidationErrors;

  const ValidationErrors._();

  bool get hasErrors => deckNameError != null || deckNameOpponentError != null;
}
