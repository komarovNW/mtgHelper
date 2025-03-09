// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_scg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceSCGState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScgCardsModel> list) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScgCardsModel> list)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScgCardsModel> list)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceSCGLoading value) loading,
    required TResult Function(PriceSCGSuccess value) success,
    required TResult Function(PriceSCGFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSCGLoading value)? loading,
    TResult? Function(PriceSCGSuccess value)? success,
    TResult? Function(PriceSCGFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSCGLoading value)? loading,
    TResult Function(PriceSCGSuccess value)? success,
    TResult Function(PriceSCGFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceSCGStateCopyWith<$Res> {
  factory $PriceSCGStateCopyWith(
          PriceSCGState value, $Res Function(PriceSCGState) then) =
      _$PriceSCGStateCopyWithImpl<$Res, PriceSCGState>;
}

/// @nodoc
class _$PriceSCGStateCopyWithImpl<$Res, $Val extends PriceSCGState>
    implements $PriceSCGStateCopyWith<$Res> {
  _$PriceSCGStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PriceSCGLoadingImplCopyWith<$Res> {
  factory _$$PriceSCGLoadingImplCopyWith(_$PriceSCGLoadingImpl value,
          $Res Function(_$PriceSCGLoadingImpl) then) =
      __$$PriceSCGLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceSCGLoadingImplCopyWithImpl<$Res>
    extends _$PriceSCGStateCopyWithImpl<$Res, _$PriceSCGLoadingImpl>
    implements _$$PriceSCGLoadingImplCopyWith<$Res> {
  __$$PriceSCGLoadingImplCopyWithImpl(
      _$PriceSCGLoadingImpl _value, $Res Function(_$PriceSCGLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PriceSCGLoadingImpl implements PriceSCGLoading {
  const _$PriceSCGLoadingImpl();

  @override
  String toString() {
    return 'PriceSCGState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PriceSCGLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScgCardsModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScgCardsModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScgCardsModel> list)? success,
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
    required TResult Function(PriceSCGLoading value) loading,
    required TResult Function(PriceSCGSuccess value) success,
    required TResult Function(PriceSCGFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSCGLoading value)? loading,
    TResult? Function(PriceSCGSuccess value)? success,
    TResult? Function(PriceSCGFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSCGLoading value)? loading,
    TResult Function(PriceSCGSuccess value)? success,
    TResult Function(PriceSCGFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PriceSCGLoading implements PriceSCGState {
  const factory PriceSCGLoading() = _$PriceSCGLoadingImpl;
}

/// @nodoc
abstract class _$$PriceSCGSuccessImplCopyWith<$Res> {
  factory _$$PriceSCGSuccessImplCopyWith(_$PriceSCGSuccessImpl value,
          $Res Function(_$PriceSCGSuccessImpl) then) =
      __$$PriceSCGSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ScgCardsModel> list});
}

/// @nodoc
class __$$PriceSCGSuccessImplCopyWithImpl<$Res>
    extends _$PriceSCGStateCopyWithImpl<$Res, _$PriceSCGSuccessImpl>
    implements _$$PriceSCGSuccessImplCopyWith<$Res> {
  __$$PriceSCGSuccessImplCopyWithImpl(
      _$PriceSCGSuccessImpl _value, $Res Function(_$PriceSCGSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$PriceSCGSuccessImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ScgCardsModel>,
    ));
  }
}

/// @nodoc

class _$PriceSCGSuccessImpl implements PriceSCGSuccess {
  const _$PriceSCGSuccessImpl({required final List<ScgCardsModel> list})
      : _list = list;

  final List<ScgCardsModel> _list;
  @override
  List<ScgCardsModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'PriceSCGState.success(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceSCGSuccessImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceSCGSuccessImplCopyWith<_$PriceSCGSuccessImpl> get copyWith =>
      __$$PriceSCGSuccessImplCopyWithImpl<_$PriceSCGSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScgCardsModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return success(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScgCardsModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScgCardsModel> list)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceSCGLoading value) loading,
    required TResult Function(PriceSCGSuccess value) success,
    required TResult Function(PriceSCGFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSCGLoading value)? loading,
    TResult? Function(PriceSCGSuccess value)? success,
    TResult? Function(PriceSCGFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSCGLoading value)? loading,
    TResult Function(PriceSCGSuccess value)? success,
    TResult Function(PriceSCGFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PriceSCGSuccess implements PriceSCGState {
  const factory PriceSCGSuccess({required final List<ScgCardsModel> list}) =
      _$PriceSCGSuccessImpl;

  List<ScgCardsModel> get list;

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceSCGSuccessImplCopyWith<_$PriceSCGSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceSCGFailureImplCopyWith<$Res> {
  factory _$$PriceSCGFailureImplCopyWith(_$PriceSCGFailureImpl value,
          $Res Function(_$PriceSCGFailureImpl) then) =
      __$$PriceSCGFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PriceSCGFailureImplCopyWithImpl<$Res>
    extends _$PriceSCGStateCopyWithImpl<$Res, _$PriceSCGFailureImpl>
    implements _$$PriceSCGFailureImplCopyWith<$Res> {
  __$$PriceSCGFailureImplCopyWithImpl(
      _$PriceSCGFailureImpl _value, $Res Function(_$PriceSCGFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PriceSCGFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PriceSCGFailureImpl implements PriceSCGFailure {
  const _$PriceSCGFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PriceSCGState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceSCGFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceSCGFailureImplCopyWith<_$PriceSCGFailureImpl> get copyWith =>
      __$$PriceSCGFailureImplCopyWithImpl<_$PriceSCGFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScgCardsModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScgCardsModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScgCardsModel> list)? success,
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
    required TResult Function(PriceSCGLoading value) loading,
    required TResult Function(PriceSCGSuccess value) success,
    required TResult Function(PriceSCGFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSCGLoading value)? loading,
    TResult? Function(PriceSCGSuccess value)? success,
    TResult? Function(PriceSCGFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSCGLoading value)? loading,
    TResult Function(PriceSCGSuccess value)? success,
    TResult Function(PriceSCGFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PriceSCGFailure implements PriceSCGState {
  const factory PriceSCGFailure(final String error) = _$PriceSCGFailureImpl;

  String get error;

  /// Create a copy of PriceSCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceSCGFailureImplCopyWith<_$PriceSCGFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
