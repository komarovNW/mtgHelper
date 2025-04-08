// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_record_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchRecordState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ValidationErrors get validationErrors => throw _privateConstructorUsedError;

  /// Create a copy of MatchRecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MatchRecordStateCopyWith<MatchRecordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchRecordStateCopyWith<$Res> {
  factory $MatchRecordStateCopyWith(
          MatchRecordState value, $Res Function(MatchRecordState) then) =
      _$MatchRecordStateCopyWithImpl<$Res, MatchRecordState>;
  @useResult
  $Res call(
      {bool isSubmitting, bool isSuccess, ValidationErrors validationErrors});

  $ValidationErrorsCopyWith<$Res> get validationErrors;
}

/// @nodoc
class _$MatchRecordStateCopyWithImpl<$Res, $Val extends MatchRecordState>
    implements $MatchRecordStateCopyWith<$Res> {
  _$MatchRecordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchRecordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? validationErrors = null,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      validationErrors: null == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as ValidationErrors,
    ) as $Val);
  }

  /// Create a copy of MatchRecordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ValidationErrorsCopyWith<$Res> get validationErrors {
    return $ValidationErrorsCopyWith<$Res>(_value.validationErrors, (value) {
      return _then(_value.copyWith(validationErrors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchRecordStateImplCopyWith<$Res>
    implements $MatchRecordStateCopyWith<$Res> {
  factory _$$MatchRecordStateImplCopyWith(_$MatchRecordStateImpl value,
          $Res Function(_$MatchRecordStateImpl) then) =
      __$$MatchRecordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting, bool isSuccess, ValidationErrors validationErrors});

  @override
  $ValidationErrorsCopyWith<$Res> get validationErrors;
}

/// @nodoc
class __$$MatchRecordStateImplCopyWithImpl<$Res>
    extends _$MatchRecordStateCopyWithImpl<$Res, _$MatchRecordStateImpl>
    implements _$$MatchRecordStateImplCopyWith<$Res> {
  __$$MatchRecordStateImplCopyWithImpl(_$MatchRecordStateImpl _value,
      $Res Function(_$MatchRecordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchRecordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? validationErrors = null,
  }) {
    return _then(_$MatchRecordStateImpl(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      validationErrors: null == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as ValidationErrors,
    ));
  }
}

/// @nodoc

class _$MatchRecordStateImpl implements _MatchRecordState {
  const _$MatchRecordStateImpl(
      {this.isSubmitting = false,
      this.isSuccess = false,
      this.validationErrors = const ValidationErrors()});

  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final ValidationErrors validationErrors;

  @override
  String toString() {
    return 'MatchRecordState(isSubmitting: $isSubmitting, isSuccess: $isSuccess, validationErrors: $validationErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchRecordStateImpl &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.validationErrors, validationErrors) ||
                other.validationErrors == validationErrors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isSubmitting, isSuccess, validationErrors);

  /// Create a copy of MatchRecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchRecordStateImplCopyWith<_$MatchRecordStateImpl> get copyWith =>
      __$$MatchRecordStateImplCopyWithImpl<_$MatchRecordStateImpl>(
          this, _$identity);
}

abstract class _MatchRecordState implements MatchRecordState {
  const factory _MatchRecordState(
      {final bool isSubmitting,
      final bool isSuccess,
      final ValidationErrors validationErrors}) = _$MatchRecordStateImpl;

  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  ValidationErrors get validationErrors;

  /// Create a copy of MatchRecordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchRecordStateImplCopyWith<_$MatchRecordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValidationErrors {
  String? get deckNameError => throw _privateConstructorUsedError;
  String? get deckNameOpponentError => throw _privateConstructorUsedError;

  /// Create a copy of ValidationErrors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ValidationErrorsCopyWith<ValidationErrors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationErrorsCopyWith<$Res> {
  factory $ValidationErrorsCopyWith(
          ValidationErrors value, $Res Function(ValidationErrors) then) =
      _$ValidationErrorsCopyWithImpl<$Res, ValidationErrors>;
  @useResult
  $Res call({String? deckNameError, String? deckNameOpponentError});
}

/// @nodoc
class _$ValidationErrorsCopyWithImpl<$Res, $Val extends ValidationErrors>
    implements $ValidationErrorsCopyWith<$Res> {
  _$ValidationErrorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ValidationErrors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckNameError = freezed,
    Object? deckNameOpponentError = freezed,
  }) {
    return _then(_value.copyWith(
      deckNameError: freezed == deckNameError
          ? _value.deckNameError
          : deckNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      deckNameOpponentError: freezed == deckNameOpponentError
          ? _value.deckNameOpponentError
          : deckNameOpponentError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidationErrorsImplCopyWith<$Res>
    implements $ValidationErrorsCopyWith<$Res> {
  factory _$$ValidationErrorsImplCopyWith(_$ValidationErrorsImpl value,
          $Res Function(_$ValidationErrorsImpl) then) =
      __$$ValidationErrorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? deckNameError, String? deckNameOpponentError});
}

/// @nodoc
class __$$ValidationErrorsImplCopyWithImpl<$Res>
    extends _$ValidationErrorsCopyWithImpl<$Res, _$ValidationErrorsImpl>
    implements _$$ValidationErrorsImplCopyWith<$Res> {
  __$$ValidationErrorsImplCopyWithImpl(_$ValidationErrorsImpl _value,
      $Res Function(_$ValidationErrorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationErrors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deckNameError = freezed,
    Object? deckNameOpponentError = freezed,
  }) {
    return _then(_$ValidationErrorsImpl(
      deckNameError: freezed == deckNameError
          ? _value.deckNameError
          : deckNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      deckNameOpponentError: freezed == deckNameOpponentError
          ? _value.deckNameOpponentError
          : deckNameOpponentError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ValidationErrorsImpl extends _ValidationErrors {
  const _$ValidationErrorsImpl({this.deckNameError, this.deckNameOpponentError})
      : super._();

  @override
  final String? deckNameError;
  @override
  final String? deckNameOpponentError;

  @override
  String toString() {
    return 'ValidationErrors(deckNameError: $deckNameError, deckNameOpponentError: $deckNameOpponentError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorsImpl &&
            (identical(other.deckNameError, deckNameError) ||
                other.deckNameError == deckNameError) &&
            (identical(other.deckNameOpponentError, deckNameOpponentError) ||
                other.deckNameOpponentError == deckNameOpponentError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, deckNameError, deckNameOpponentError);

  /// Create a copy of ValidationErrors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorsImplCopyWith<_$ValidationErrorsImpl> get copyWith =>
      __$$ValidationErrorsImplCopyWithImpl<_$ValidationErrorsImpl>(
          this, _$identity);
}

abstract class _ValidationErrors extends ValidationErrors {
  const factory _ValidationErrors(
      {final String? deckNameError,
      final String? deckNameOpponentError}) = _$ValidationErrorsImpl;
  const _ValidationErrors._() : super._();

  @override
  String? get deckNameError;
  @override
  String? get deckNameOpponentError;

  /// Create a copy of ValidationErrors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorsImplCopyWith<_$ValidationErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
