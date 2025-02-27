// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auctions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuctionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Auction> allAuctions) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Auction> allAuctions)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Auction> allAuctions)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuctionsLoading value) loading,
    required TResult Function(AuctionsSuccess value) success,
    required TResult Function(AuctionsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionsLoading value)? loading,
    TResult? Function(AuctionsSuccess value)? success,
    TResult? Function(AuctionsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionsLoading value)? loading,
    TResult Function(AuctionsSuccess value)? success,
    TResult Function(AuctionsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionsStateCopyWith<$Res> {
  factory $AuctionsStateCopyWith(
          AuctionsState value, $Res Function(AuctionsState) then) =
      _$AuctionsStateCopyWithImpl<$Res, AuctionsState>;
}

/// @nodoc
class _$AuctionsStateCopyWithImpl<$Res, $Val extends AuctionsState>
    implements $AuctionsStateCopyWith<$Res> {
  _$AuctionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuctionsLoadingImplCopyWith<$Res> {
  factory _$$AuctionsLoadingImplCopyWith(_$AuctionsLoadingImpl value,
          $Res Function(_$AuctionsLoadingImpl) then) =
      __$$AuctionsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuctionsLoadingImplCopyWithImpl<$Res>
    extends _$AuctionsStateCopyWithImpl<$Res, _$AuctionsLoadingImpl>
    implements _$$AuctionsLoadingImplCopyWith<$Res> {
  __$$AuctionsLoadingImplCopyWithImpl(
      _$AuctionsLoadingImpl _value, $Res Function(_$AuctionsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuctionsLoadingImpl implements AuctionsLoading {
  const _$AuctionsLoadingImpl();

  @override
  String toString() {
    return 'AuctionsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuctionsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Auction> allAuctions) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Auction> allAuctions)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Auction> allAuctions)? success,
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
    required TResult Function(AuctionsLoading value) loading,
    required TResult Function(AuctionsSuccess value) success,
    required TResult Function(AuctionsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionsLoading value)? loading,
    TResult? Function(AuctionsSuccess value)? success,
    TResult? Function(AuctionsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionsLoading value)? loading,
    TResult Function(AuctionsSuccess value)? success,
    TResult Function(AuctionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuctionsLoading implements AuctionsState {
  const factory AuctionsLoading() = _$AuctionsLoadingImpl;
}

/// @nodoc
abstract class _$$AuctionsSuccessImplCopyWith<$Res> {
  factory _$$AuctionsSuccessImplCopyWith(_$AuctionsSuccessImpl value,
          $Res Function(_$AuctionsSuccessImpl) then) =
      __$$AuctionsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Auction> allAuctions});
}

/// @nodoc
class __$$AuctionsSuccessImplCopyWithImpl<$Res>
    extends _$AuctionsStateCopyWithImpl<$Res, _$AuctionsSuccessImpl>
    implements _$$AuctionsSuccessImplCopyWith<$Res> {
  __$$AuctionsSuccessImplCopyWithImpl(
      _$AuctionsSuccessImpl _value, $Res Function(_$AuctionsSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAuctions = null,
  }) {
    return _then(_$AuctionsSuccessImpl(
      allAuctions: null == allAuctions
          ? _value._allAuctions
          : allAuctions // ignore: cast_nullable_to_non_nullable
              as List<Auction>,
    ));
  }
}

/// @nodoc

class _$AuctionsSuccessImpl implements AuctionsSuccess {
  const _$AuctionsSuccessImpl({required final List<Auction> allAuctions})
      : _allAuctions = allAuctions;

  final List<Auction> _allAuctions;
  @override
  List<Auction> get allAuctions {
    if (_allAuctions is EqualUnmodifiableListView) return _allAuctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allAuctions);
  }

  @override
  String toString() {
    return 'AuctionsState.success(allAuctions: $allAuctions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionsSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._allAuctions, _allAuctions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_allAuctions));

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionsSuccessImplCopyWith<_$AuctionsSuccessImpl> get copyWith =>
      __$$AuctionsSuccessImplCopyWithImpl<_$AuctionsSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Auction> allAuctions) success,
    required TResult Function(String error) failure,
  }) {
    return success(allAuctions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Auction> allAuctions)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(allAuctions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Auction> allAuctions)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(allAuctions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuctionsLoading value) loading,
    required TResult Function(AuctionsSuccess value) success,
    required TResult Function(AuctionsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionsLoading value)? loading,
    TResult? Function(AuctionsSuccess value)? success,
    TResult? Function(AuctionsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionsLoading value)? loading,
    TResult Function(AuctionsSuccess value)? success,
    TResult Function(AuctionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuctionsSuccess implements AuctionsState {
  const factory AuctionsSuccess({required final List<Auction> allAuctions}) =
      _$AuctionsSuccessImpl;

  List<Auction> get allAuctions;

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuctionsSuccessImplCopyWith<_$AuctionsSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuctionsFailureImplCopyWith<$Res> {
  factory _$$AuctionsFailureImplCopyWith(_$AuctionsFailureImpl value,
          $Res Function(_$AuctionsFailureImpl) then) =
      __$$AuctionsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AuctionsFailureImplCopyWithImpl<$Res>
    extends _$AuctionsStateCopyWithImpl<$Res, _$AuctionsFailureImpl>
    implements _$$AuctionsFailureImplCopyWith<$Res> {
  __$$AuctionsFailureImplCopyWithImpl(
      _$AuctionsFailureImpl _value, $Res Function(_$AuctionsFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AuctionsFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuctionsFailureImpl implements AuctionsFailure {
  const _$AuctionsFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuctionsState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionsFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionsFailureImplCopyWith<_$AuctionsFailureImpl> get copyWith =>
      __$$AuctionsFailureImplCopyWithImpl<_$AuctionsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Auction> allAuctions) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Auction> allAuctions)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Auction> allAuctions)? success,
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
    required TResult Function(AuctionsLoading value) loading,
    required TResult Function(AuctionsSuccess value) success,
    required TResult Function(AuctionsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionsLoading value)? loading,
    TResult? Function(AuctionsSuccess value)? success,
    TResult? Function(AuctionsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionsLoading value)? loading,
    TResult Function(AuctionsSuccess value)? success,
    TResult Function(AuctionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuctionsFailure implements AuctionsState {
  const factory AuctionsFailure(final String error) = _$AuctionsFailureImpl;

  String get error;

  /// Create a copy of AuctionsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuctionsFailureImplCopyWith<_$AuctionsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
