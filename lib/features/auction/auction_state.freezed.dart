// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuctionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Map<String, dynamic>> allAuctions, bool hasMore)
        success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuctionLoading value) loading,
    required TResult Function(AuctionSuccess value) success,
    required TResult Function(AuctionFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionLoading value)? loading,
    TResult? Function(AuctionSuccess value)? success,
    TResult? Function(AuctionFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionLoading value)? loading,
    TResult Function(AuctionSuccess value)? success,
    TResult Function(AuctionFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionStateCopyWith<$Res> {
  factory $AuctionStateCopyWith(
          AuctionState value, $Res Function(AuctionState) then) =
      _$AuctionStateCopyWithImpl<$Res, AuctionState>;
}

/// @nodoc
class _$AuctionStateCopyWithImpl<$Res, $Val extends AuctionState>
    implements $AuctionStateCopyWith<$Res> {
  _$AuctionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuctionLoadingImplCopyWith<$Res> {
  factory _$$AuctionLoadingImplCopyWith(_$AuctionLoadingImpl value,
          $Res Function(_$AuctionLoadingImpl) then) =
      __$$AuctionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuctionLoadingImplCopyWithImpl<$Res>
    extends _$AuctionStateCopyWithImpl<$Res, _$AuctionLoadingImpl>
    implements _$$AuctionLoadingImplCopyWith<$Res> {
  __$$AuctionLoadingImplCopyWithImpl(
      _$AuctionLoadingImpl _value, $Res Function(_$AuctionLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuctionLoadingImpl implements AuctionLoading {
  const _$AuctionLoadingImpl();

  @override
  String toString() {
    return 'AuctionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuctionLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Map<String, dynamic>> allAuctions, bool hasMore)
        success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
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
    required TResult Function(AuctionLoading value) loading,
    required TResult Function(AuctionSuccess value) success,
    required TResult Function(AuctionFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionLoading value)? loading,
    TResult? Function(AuctionSuccess value)? success,
    TResult? Function(AuctionFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionLoading value)? loading,
    TResult Function(AuctionSuccess value)? success,
    TResult Function(AuctionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuctionLoading implements AuctionState {
  const factory AuctionLoading() = _$AuctionLoadingImpl;
}

/// @nodoc
abstract class _$$AuctionSuccessImplCopyWith<$Res> {
  factory _$$AuctionSuccessImplCopyWith(_$AuctionSuccessImpl value,
          $Res Function(_$AuctionSuccessImpl) then) =
      __$$AuctionSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Map<String, dynamic>> allAuctions, bool hasMore});
}

/// @nodoc
class __$$AuctionSuccessImplCopyWithImpl<$Res>
    extends _$AuctionStateCopyWithImpl<$Res, _$AuctionSuccessImpl>
    implements _$$AuctionSuccessImplCopyWith<$Res> {
  __$$AuctionSuccessImplCopyWithImpl(
      _$AuctionSuccessImpl _value, $Res Function(_$AuctionSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAuctions = null,
    Object? hasMore = null,
  }) {
    return _then(_$AuctionSuccessImpl(
      allAuctions: null == allAuctions
          ? _value._allAuctions
          : allAuctions // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuctionSuccessImpl implements AuctionSuccess {
  const _$AuctionSuccessImpl(
      {required final List<Map<String, dynamic>> allAuctions,
      required this.hasMore})
      : _allAuctions = allAuctions;

// required List<Map<String, dynamic>> visibleAuctions,
  final List<Map<String, dynamic>> _allAuctions;
// required List<Map<String, dynamic>> visibleAuctions,
  @override
  List<Map<String, dynamic>> get allAuctions {
    if (_allAuctions is EqualUnmodifiableListView) return _allAuctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allAuctions);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'AuctionState.success(allAuctions: $allAuctions, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._allAuctions, _allAuctions) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_allAuctions), hasMore);

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionSuccessImplCopyWith<_$AuctionSuccessImpl> get copyWith =>
      __$$AuctionSuccessImplCopyWithImpl<_$AuctionSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Map<String, dynamic>> allAuctions, bool hasMore)
        success,
    required TResult Function(String error) failure,
  }) {
    return success(allAuctions, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(allAuctions, hasMore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(allAuctions, hasMore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuctionLoading value) loading,
    required TResult Function(AuctionSuccess value) success,
    required TResult Function(AuctionFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionLoading value)? loading,
    TResult? Function(AuctionSuccess value)? success,
    TResult? Function(AuctionFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionLoading value)? loading,
    TResult Function(AuctionSuccess value)? success,
    TResult Function(AuctionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuctionSuccess implements AuctionState {
  const factory AuctionSuccess(
      {required final List<Map<String, dynamic>> allAuctions,
      required final bool hasMore}) = _$AuctionSuccessImpl;

// required List<Map<String, dynamic>> visibleAuctions,
  List<Map<String, dynamic>> get allAuctions;
  bool get hasMore;

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuctionSuccessImplCopyWith<_$AuctionSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuctionFailureImplCopyWith<$Res> {
  factory _$$AuctionFailureImplCopyWith(_$AuctionFailureImpl value,
          $Res Function(_$AuctionFailureImpl) then) =
      __$$AuctionFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$AuctionFailureImplCopyWithImpl<$Res>
    extends _$AuctionStateCopyWithImpl<$Res, _$AuctionFailureImpl>
    implements _$$AuctionFailureImplCopyWith<$Res> {
  __$$AuctionFailureImplCopyWithImpl(
      _$AuctionFailureImpl _value, $Res Function(_$AuctionFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AuctionFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuctionFailureImpl implements AuctionFailure {
  const _$AuctionFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuctionState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionFailureImplCopyWith<_$AuctionFailureImpl> get copyWith =>
      __$$AuctionFailureImplCopyWithImpl<_$AuctionFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Map<String, dynamic>> allAuctions, bool hasMore)
        success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Map<String, dynamic>> allAuctions, bool hasMore)?
        success,
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
    required TResult Function(AuctionLoading value) loading,
    required TResult Function(AuctionSuccess value) success,
    required TResult Function(AuctionFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuctionLoading value)? loading,
    TResult? Function(AuctionSuccess value)? success,
    TResult? Function(AuctionFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuctionLoading value)? loading,
    TResult Function(AuctionSuccess value)? success,
    TResult Function(AuctionFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuctionFailure implements AuctionState {
  const factory AuctionFailure(final String error) = _$AuctionFailureImpl;

  String get error;

  /// Create a copy of AuctionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuctionFailureImplCopyWith<_$AuctionFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
