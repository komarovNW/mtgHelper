// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get firebaseError => throw _privateConstructorUsedError;
  ValidationErrors get validationErrors => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationStateCopyWith<RegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      bool isSuccess,
      String? firebaseError,
      ValidationErrors validationErrors});

  $ValidationErrorsCopyWith<$Res> get validationErrors;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? firebaseError = freezed,
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
      firebaseError: freezed == firebaseError
          ? _value.firebaseError
          : firebaseError // ignore: cast_nullable_to_non_nullable
              as String?,
      validationErrors: null == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as ValidationErrors,
    ) as $Val);
  }

  /// Create a copy of RegistrationState
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
abstract class _$$RegistrationStateImplCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory _$$RegistrationStateImplCopyWith(_$RegistrationStateImpl value,
          $Res Function(_$RegistrationStateImpl) then) =
      __$$RegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      bool isSuccess,
      String? firebaseError,
      ValidationErrors validationErrors});

  @override
  $ValidationErrorsCopyWith<$Res> get validationErrors;
}

/// @nodoc
class __$$RegistrationStateImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationStateImpl>
    implements _$$RegistrationStateImplCopyWith<$Res> {
  __$$RegistrationStateImplCopyWithImpl(_$RegistrationStateImpl _value,
      $Res Function(_$RegistrationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? firebaseError = freezed,
    Object? validationErrors = null,
  }) {
    return _then(_$RegistrationStateImpl(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      firebaseError: freezed == firebaseError
          ? _value.firebaseError
          : firebaseError // ignore: cast_nullable_to_non_nullable
              as String?,
      validationErrors: null == validationErrors
          ? _value.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as ValidationErrors,
    ));
  }
}

/// @nodoc

class _$RegistrationStateImpl implements _RegistrationState {
  const _$RegistrationStateImpl(
      {this.isSubmitting = false,
      this.isSuccess = false,
      this.firebaseError,
      this.validationErrors = const ValidationErrors()});

  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? firebaseError;
  @override
  @JsonKey()
  final ValidationErrors validationErrors;

  @override
  String toString() {
    return 'RegistrationState(isSubmitting: $isSubmitting, isSuccess: $isSuccess, firebaseError: $firebaseError, validationErrors: $validationErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStateImpl &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.firebaseError, firebaseError) ||
                other.firebaseError == firebaseError) &&
            (identical(other.validationErrors, validationErrors) ||
                other.validationErrors == validationErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSubmitting, isSuccess, firebaseError, validationErrors);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      __$$RegistrationStateImplCopyWithImpl<_$RegistrationStateImpl>(
          this, _$identity);
}

abstract class _RegistrationState implements RegistrationState {
  const factory _RegistrationState(
      {final bool isSubmitting,
      final bool isSuccess,
      final String? firebaseError,
      final ValidationErrors validationErrors}) = _$RegistrationStateImpl;

  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  String? get firebaseError;
  @override
  ValidationErrors get validationErrors;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValidationErrors {
  String? get emailError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  String? get repeatPasswordError => throw _privateConstructorUsedError;

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
  $Res call(
      {String? emailError, String? passwordError, String? repeatPasswordError});
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
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? repeatPasswordError = freezed,
  }) {
    return _then(_value.copyWith(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatPasswordError: freezed == repeatPasswordError
          ? _value.repeatPasswordError
          : repeatPasswordError // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {String? emailError, String? passwordError, String? repeatPasswordError});
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
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? repeatPasswordError = freezed,
  }) {
    return _then(_$ValidationErrorsImpl(
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatPasswordError: freezed == repeatPasswordError
          ? _value.repeatPasswordError
          : repeatPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ValidationErrorsImpl extends _ValidationErrors {
  const _$ValidationErrorsImpl(
      {this.emailError, this.passwordError, this.repeatPasswordError})
      : super._();

  @override
  final String? emailError;
  @override
  final String? passwordError;
  @override
  final String? repeatPasswordError;

  @override
  String toString() {
    return 'ValidationErrors(emailError: $emailError, passwordError: $passwordError, repeatPasswordError: $repeatPasswordError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorsImpl &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.repeatPasswordError, repeatPasswordError) ||
                other.repeatPasswordError == repeatPasswordError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailError, passwordError, repeatPasswordError);

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
      {final String? emailError,
      final String? passwordError,
      final String? repeatPasswordError}) = _$ValidationErrorsImpl;
  const _ValidationErrors._() : super._();

  @override
  String? get emailError;
  @override
  String? get passwordError;
  @override
  String? get repeatPasswordError;

  /// Create a copy of ValidationErrors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorsImplCopyWith<_$ValidationErrorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
