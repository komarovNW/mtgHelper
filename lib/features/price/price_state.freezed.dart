// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchCardModel> allCards) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchCardModel> allCards)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchCardModel> allCards)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceInitial value) initial,
    required TResult Function(PriceLoading value) loading,
    required TResult Function(PriceSuccess value) success,
    required TResult Function(PriceFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceInitial value)? initial,
    TResult? Function(PriceLoading value)? loading,
    TResult? Function(PriceSuccess value)? success,
    TResult? Function(PriceFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceInitial value)? initial,
    TResult Function(PriceLoading value)? loading,
    TResult Function(PriceSuccess value)? success,
    TResult Function(PriceFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceStateCopyWith<$Res> {
  factory $PriceStateCopyWith(
          PriceState value, $Res Function(PriceState) then) =
      _$PriceStateCopyWithImpl<$Res, PriceState>;
}

/// @nodoc
class _$PriceStateCopyWithImpl<$Res, $Val extends PriceState>
    implements $PriceStateCopyWith<$Res> {
  _$PriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PriceInitialImplCopyWith<$Res> {
  factory _$$PriceInitialImplCopyWith(
          _$PriceInitialImpl value, $Res Function(_$PriceInitialImpl) then) =
      __$$PriceInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceInitialImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$PriceInitialImpl>
    implements _$$PriceInitialImplCopyWith<$Res> {
  __$$PriceInitialImplCopyWithImpl(
      _$PriceInitialImpl _value, $Res Function(_$PriceInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PriceInitialImpl implements PriceInitial {
  const _$PriceInitialImpl();

  @override
  String toString() {
    return 'PriceState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PriceInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchCardModel> allCards) success,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchCardModel> allCards)? success,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchCardModel> allCards)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceInitial value) initial,
    required TResult Function(PriceLoading value) loading,
    required TResult Function(PriceSuccess value) success,
    required TResult Function(PriceFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceInitial value)? initial,
    TResult? Function(PriceLoading value)? loading,
    TResult? Function(PriceSuccess value)? success,
    TResult? Function(PriceFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceInitial value)? initial,
    TResult Function(PriceLoading value)? loading,
    TResult Function(PriceSuccess value)? success,
    TResult Function(PriceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PriceInitial implements PriceState {
  const factory PriceInitial() = _$PriceInitialImpl;
}

/// @nodoc
abstract class _$$PriceLoadingImplCopyWith<$Res> {
  factory _$$PriceLoadingImplCopyWith(
          _$PriceLoadingImpl value, $Res Function(_$PriceLoadingImpl) then) =
      __$$PriceLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceLoadingImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$PriceLoadingImpl>
    implements _$$PriceLoadingImplCopyWith<$Res> {
  __$$PriceLoadingImplCopyWithImpl(
      _$PriceLoadingImpl _value, $Res Function(_$PriceLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PriceLoadingImpl implements PriceLoading {
  const _$PriceLoadingImpl();

  @override
  String toString() {
    return 'PriceState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PriceLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchCardModel> allCards) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchCardModel> allCards)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchCardModel> allCards)? success,
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
    required TResult Function(PriceInitial value) initial,
    required TResult Function(PriceLoading value) loading,
    required TResult Function(PriceSuccess value) success,
    required TResult Function(PriceFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceInitial value)? initial,
    TResult? Function(PriceLoading value)? loading,
    TResult? Function(PriceSuccess value)? success,
    TResult? Function(PriceFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceInitial value)? initial,
    TResult Function(PriceLoading value)? loading,
    TResult Function(PriceSuccess value)? success,
    TResult Function(PriceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PriceLoading implements PriceState {
  const factory PriceLoading() = _$PriceLoadingImpl;
}

/// @nodoc
abstract class _$$PriceSuccessImplCopyWith<$Res> {
  factory _$$PriceSuccessImplCopyWith(
          _$PriceSuccessImpl value, $Res Function(_$PriceSuccessImpl) then) =
      __$$PriceSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SearchCardModel> allCards});
}

/// @nodoc
class __$$PriceSuccessImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$PriceSuccessImpl>
    implements _$$PriceSuccessImplCopyWith<$Res> {
  __$$PriceSuccessImplCopyWithImpl(
      _$PriceSuccessImpl _value, $Res Function(_$PriceSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allCards = null,
  }) {
    return _then(_$PriceSuccessImpl(
      allCards: null == allCards
          ? _value._allCards
          : allCards // ignore: cast_nullable_to_non_nullable
              as List<SearchCardModel>,
    ));
  }
}

/// @nodoc

class _$PriceSuccessImpl implements PriceSuccess {
  const _$PriceSuccessImpl({required final List<SearchCardModel> allCards})
      : _allCards = allCards;

  final List<SearchCardModel> _allCards;
  @override
  List<SearchCardModel> get allCards {
    if (_allCards is EqualUnmodifiableListView) return _allCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCards);
  }

  @override
  String toString() {
    return 'PriceState.success(allCards: $allCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceSuccessImpl &&
            const DeepCollectionEquality().equals(other._allCards, _allCards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_allCards));

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceSuccessImplCopyWith<_$PriceSuccessImpl> get copyWith =>
      __$$PriceSuccessImplCopyWithImpl<_$PriceSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchCardModel> allCards) success,
    required TResult Function(String error) failure,
  }) {
    return success(allCards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchCardModel> allCards)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(allCards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchCardModel> allCards)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(allCards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceInitial value) initial,
    required TResult Function(PriceLoading value) loading,
    required TResult Function(PriceSuccess value) success,
    required TResult Function(PriceFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceInitial value)? initial,
    TResult? Function(PriceLoading value)? loading,
    TResult? Function(PriceSuccess value)? success,
    TResult? Function(PriceFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceInitial value)? initial,
    TResult Function(PriceLoading value)? loading,
    TResult Function(PriceSuccess value)? success,
    TResult Function(PriceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PriceSuccess implements PriceState {
  const factory PriceSuccess({required final List<SearchCardModel> allCards}) =
      _$PriceSuccessImpl;

  List<SearchCardModel> get allCards;

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceSuccessImplCopyWith<_$PriceSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceFailureImplCopyWith<$Res> {
  factory _$$PriceFailureImplCopyWith(
          _$PriceFailureImpl value, $Res Function(_$PriceFailureImpl) then) =
      __$$PriceFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PriceFailureImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$PriceFailureImpl>
    implements _$$PriceFailureImplCopyWith<$Res> {
  __$$PriceFailureImplCopyWithImpl(
      _$PriceFailureImpl _value, $Res Function(_$PriceFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PriceFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PriceFailureImpl implements PriceFailure {
  const _$PriceFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PriceState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceFailureImplCopyWith<_$PriceFailureImpl> get copyWith =>
      __$$PriceFailureImplCopyWithImpl<_$PriceFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<SearchCardModel> allCards) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<SearchCardModel> allCards)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<SearchCardModel> allCards)? success,
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
    required TResult Function(PriceInitial value) initial,
    required TResult Function(PriceLoading value) loading,
    required TResult Function(PriceSuccess value) success,
    required TResult Function(PriceFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceInitial value)? initial,
    TResult? Function(PriceLoading value)? loading,
    TResult? Function(PriceSuccess value)? success,
    TResult? Function(PriceFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceInitial value)? initial,
    TResult Function(PriceLoading value)? loading,
    TResult Function(PriceSuccess value)? success,
    TResult Function(PriceFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PriceFailure implements PriceState {
  const factory PriceFailure(final String error) = _$PriceFailureImpl;

  String get error;

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceFailureImplCopyWith<_$PriceFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
