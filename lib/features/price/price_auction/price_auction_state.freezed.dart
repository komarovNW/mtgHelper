// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_auction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceAuctionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AllAuctionsModel item) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AllAuctionsModel item)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AllAuctionsModel item)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceAuctionLoading value) loading,
    required TResult Function(PriceAuctionSuccess value) success,
    required TResult Function(PriceAuctionFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceAuctionLoading value)? loading,
    TResult? Function(PriceAuctionSuccess value)? success,
    TResult? Function(PriceAuctionFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceAuctionLoading value)? loading,
    TResult Function(PriceAuctionSuccess value)? success,
    TResult Function(PriceAuctionFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceAuctionStateCopyWith<$Res> {
  factory $PriceAuctionStateCopyWith(
          PriceAuctionState value, $Res Function(PriceAuctionState) then) =
      _$PriceAuctionStateCopyWithImpl<$Res, PriceAuctionState>;
}

/// @nodoc
class _$PriceAuctionStateCopyWithImpl<$Res, $Val extends PriceAuctionState>
    implements $PriceAuctionStateCopyWith<$Res> {
  _$PriceAuctionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PriceAuctionLoadingImplCopyWith<$Res> {
  factory _$$PriceAuctionLoadingImplCopyWith(_$PriceAuctionLoadingImpl value,
          $Res Function(_$PriceAuctionLoadingImpl) then) =
      __$$PriceAuctionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceAuctionLoadingImplCopyWithImpl<$Res>
    extends _$PriceAuctionStateCopyWithImpl<$Res, _$PriceAuctionLoadingImpl>
    implements _$$PriceAuctionLoadingImplCopyWith<$Res> {
  __$$PriceAuctionLoadingImplCopyWithImpl(_$PriceAuctionLoadingImpl _value,
      $Res Function(_$PriceAuctionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PriceAuctionLoadingImpl implements PriceAuctionLoading {
  const _$PriceAuctionLoadingImpl();

  @override
  String toString() {
    return 'PriceAuctionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceAuctionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AllAuctionsModel item) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AllAuctionsModel item)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AllAuctionsModel item)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceAuctionLoading value) loading,
    required TResult Function(PriceAuctionSuccess value) success,
    required TResult Function(PriceAuctionFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceAuctionLoading value)? loading,
    TResult? Function(PriceAuctionSuccess value)? success,
    TResult? Function(PriceAuctionFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceAuctionLoading value)? loading,
    TResult Function(PriceAuctionSuccess value)? success,
    TResult Function(PriceAuctionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PriceAuctionLoading implements PriceAuctionState {
  const factory PriceAuctionLoading() = _$PriceAuctionLoadingImpl;
}

/// @nodoc
abstract class _$$PriceAuctionSuccessImplCopyWith<$Res> {
  factory _$$PriceAuctionSuccessImplCopyWith(_$PriceAuctionSuccessImpl value,
          $Res Function(_$PriceAuctionSuccessImpl) then) =
      __$$PriceAuctionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AllAuctionsModel item});
}

/// @nodoc
class __$$PriceAuctionSuccessImplCopyWithImpl<$Res>
    extends _$PriceAuctionStateCopyWithImpl<$Res, _$PriceAuctionSuccessImpl>
    implements _$$PriceAuctionSuccessImplCopyWith<$Res> {
  __$$PriceAuctionSuccessImplCopyWithImpl(_$PriceAuctionSuccessImpl _value,
      $Res Function(_$PriceAuctionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$PriceAuctionSuccessImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as AllAuctionsModel,
    ));
  }
}

/// @nodoc

class _$PriceAuctionSuccessImpl implements PriceAuctionSuccess {
  const _$PriceAuctionSuccessImpl({required this.item});

  @override
  final AllAuctionsModel item;

  @override
  String toString() {
    return 'PriceAuctionState.success(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceAuctionSuccessImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceAuctionSuccessImplCopyWith<_$PriceAuctionSuccessImpl> get copyWith =>
      __$$PriceAuctionSuccessImplCopyWithImpl<_$PriceAuctionSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AllAuctionsModel item) success,
    required TResult Function(String error) failure,
  }) {
    return success(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AllAuctionsModel item)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AllAuctionsModel item)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceAuctionLoading value) loading,
    required TResult Function(PriceAuctionSuccess value) success,
    required TResult Function(PriceAuctionFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceAuctionLoading value)? loading,
    TResult? Function(PriceAuctionSuccess value)? success,
    TResult? Function(PriceAuctionFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceAuctionLoading value)? loading,
    TResult Function(PriceAuctionSuccess value)? success,
    TResult Function(PriceAuctionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PriceAuctionSuccess implements PriceAuctionState {
  const factory PriceAuctionSuccess({required final AllAuctionsModel item}) =
      _$PriceAuctionSuccessImpl;

  AllAuctionsModel get item;

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceAuctionSuccessImplCopyWith<_$PriceAuctionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceAuctionFailureImplCopyWith<$Res> {
  factory _$$PriceAuctionFailureImplCopyWith(_$PriceAuctionFailureImpl value,
          $Res Function(_$PriceAuctionFailureImpl) then) =
      __$$PriceAuctionFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PriceAuctionFailureImplCopyWithImpl<$Res>
    extends _$PriceAuctionStateCopyWithImpl<$Res, _$PriceAuctionFailureImpl>
    implements _$$PriceAuctionFailureImplCopyWith<$Res> {
  __$$PriceAuctionFailureImplCopyWithImpl(_$PriceAuctionFailureImpl _value,
      $Res Function(_$PriceAuctionFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PriceAuctionFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PriceAuctionFailureImpl implements PriceAuctionFailure {
  const _$PriceAuctionFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PriceAuctionState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceAuctionFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceAuctionFailureImplCopyWith<_$PriceAuctionFailureImpl> get copyWith =>
      __$$PriceAuctionFailureImplCopyWithImpl<_$PriceAuctionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AllAuctionsModel item) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(AllAuctionsModel item)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AllAuctionsModel item)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceAuctionLoading value) loading,
    required TResult Function(PriceAuctionSuccess value) success,
    required TResult Function(PriceAuctionFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceAuctionLoading value)? loading,
    TResult? Function(PriceAuctionSuccess value)? success,
    TResult? Function(PriceAuctionFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceAuctionLoading value)? loading,
    TResult Function(PriceAuctionSuccess value)? success,
    TResult Function(PriceAuctionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PriceAuctionFailure implements PriceAuctionState {
  const factory PriceAuctionFailure(final String error) =
      _$PriceAuctionFailureImpl;

  String get error;

  /// Create a copy of PriceAuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceAuctionFailureImplCopyWith<_$PriceAuctionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
