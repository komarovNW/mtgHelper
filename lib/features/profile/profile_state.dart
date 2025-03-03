import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  // const factory ProfileState.loading() = ProfileLoading;
  // const factory ProfileState.success() = ProfileSuccess;
  // const factory ProfileState.failure(String error) = ProfileFailure;
}
