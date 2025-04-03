import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_record_state.freezed.dart';

@freezed
class MatchRecordState with _$MatchRecordState {
  const factory MatchRecordState.initial() = MatchRecordInitial;
  const factory MatchRecordState.loading() = MatchRecordLoading;
  const factory MatchRecordState.success() = MatchRecordSuccess;
  const factory MatchRecordState.failure(String error) = MatchRecordhFailure;
}
