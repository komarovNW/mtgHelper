// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_tcg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceTCGState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScryfallCardModel> list) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScryfallCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScryfallCardModel> list)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceTCGLoading value) loading,
    required TResult Function(PriceTCGSuccess value) success,
    required TResult Function(PriceTCGFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceTCGLoading value)? loading,
    TResult? Function(PriceTCGSuccess value)? success,
    TResult? Function(PriceTCGFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceTCGLoading value)? loading,
    TResult Function(PriceTCGSuccess value)? success,
    TResult Function(PriceTCGFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTCGStateCopyWith<$Res> {
  factory $PriceTCGStateCopyWith(
          PriceTCGState value, $Res Function(PriceTCGState) then) =
      _$PriceTCGStateCopyWithImpl<$Res, PriceTCGState>;
}

/// @nodoc
class _$PriceTCGStateCopyWithImpl<$Res, $Val extends PriceTCGState>
    implements $PriceTCGStateCopyWith<$Res> {
  _$PriceTCGStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PriceTCGLoadingImplCopyWith<$Res> {
  factory _$$PriceTCGLoadingImplCopyWith(_$PriceTCGLoadingImpl value,
          $Res Function(_$PriceTCGLoadingImpl) then) =
      __$$PriceTCGLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceTCGLoadingImplCopyWithImpl<$Res>
    extends _$PriceTCGStateCopyWithImpl<$Res, _$PriceTCGLoadingImpl>
    implements _$$PriceTCGLoadingImplCopyWith<$Res> {
  __$$PriceTCGLoadingImplCopyWithImpl(
      _$PriceTCGLoadingImpl _value, $Res Function(_$PriceTCGLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PriceTCGLoadingImpl implements PriceTCGLoading {
  const _$PriceTCGLoadingImpl();

  @override
  String toString() {
    return 'PriceTCGState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PriceTCGLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScryfallCardModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScryfallCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScryfallCardModel> list)? success,
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
    required TResult Function(PriceTCGLoading value) loading,
    required TResult Function(PriceTCGSuccess value) success,
    required TResult Function(PriceTCGFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceTCGLoading value)? loading,
    TResult? Function(PriceTCGSuccess value)? success,
    TResult? Function(PriceTCGFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceTCGLoading value)? loading,
    TResult Function(PriceTCGSuccess value)? success,
    TResult Function(PriceTCGFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PriceTCGLoading implements PriceTCGState {
  const factory PriceTCGLoading() = _$PriceTCGLoadingImpl;
}

/// @nodoc
abstract class _$$PriceTCGSuccessImplCopyWith<$Res> {
  factory _$$PriceTCGSuccessImplCopyWith(_$PriceTCGSuccessImpl value,
          $Res Function(_$PriceTCGSuccessImpl) then) =
      __$$PriceTCGSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ScryfallCardModel> list});
}

/// @nodoc
class __$$PriceTCGSuccessImplCopyWithImpl<$Res>
    extends _$PriceTCGStateCopyWithImpl<$Res, _$PriceTCGSuccessImpl>
    implements _$$PriceTCGSuccessImplCopyWith<$Res> {
  __$$PriceTCGSuccessImplCopyWithImpl(
      _$PriceTCGSuccessImpl _value, $Res Function(_$PriceTCGSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$PriceTCGSuccessImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ScryfallCardModel>,
    ));
  }
}

/// @nodoc

class _$PriceTCGSuccessImpl implements PriceTCGSuccess {
  const _$PriceTCGSuccessImpl({required final List<ScryfallCardModel> list})
      : _list = list;

  final List<ScryfallCardModel> _list;
  @override
  List<ScryfallCardModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'PriceTCGState.success(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTCGSuccessImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTCGSuccessImplCopyWith<_$PriceTCGSuccessImpl> get copyWith =>
      __$$PriceTCGSuccessImplCopyWithImpl<_$PriceTCGSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScryfallCardModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return success(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScryfallCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScryfallCardModel> list)? success,
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
    required TResult Function(PriceTCGLoading value) loading,
    required TResult Function(PriceTCGSuccess value) success,
    required TResult Function(PriceTCGFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceTCGLoading value)? loading,
    TResult? Function(PriceTCGSuccess value)? success,
    TResult? Function(PriceTCGFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceTCGLoading value)? loading,
    TResult Function(PriceTCGSuccess value)? success,
    TResult Function(PriceTCGFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PriceTCGSuccess implements PriceTCGState {
  const factory PriceTCGSuccess({required final List<ScryfallCardModel> list}) =
      _$PriceTCGSuccessImpl;

  List<ScryfallCardModel> get list;

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceTCGSuccessImplCopyWith<_$PriceTCGSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceTCGFailureImplCopyWith<$Res> {
  factory _$$PriceTCGFailureImplCopyWith(_$PriceTCGFailureImpl value,
          $Res Function(_$PriceTCGFailureImpl) then) =
      __$$PriceTCGFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PriceTCGFailureImplCopyWithImpl<$Res>
    extends _$PriceTCGStateCopyWithImpl<$Res, _$PriceTCGFailureImpl>
    implements _$$PriceTCGFailureImplCopyWith<$Res> {
  __$$PriceTCGFailureImplCopyWithImpl(
      _$PriceTCGFailureImpl _value, $Res Function(_$PriceTCGFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PriceTCGFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PriceTCGFailureImpl implements PriceTCGFailure {
  const _$PriceTCGFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PriceTCGState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTCGFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTCGFailureImplCopyWith<_$PriceTCGFailureImpl> get copyWith =>
      __$$PriceTCGFailureImplCopyWithImpl<_$PriceTCGFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<ScryfallCardModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<ScryfallCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<ScryfallCardModel> list)? success,
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
    required TResult Function(PriceTCGLoading value) loading,
    required TResult Function(PriceTCGSuccess value) success,
    required TResult Function(PriceTCGFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceTCGLoading value)? loading,
    TResult? Function(PriceTCGSuccess value)? success,
    TResult? Function(PriceTCGFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceTCGLoading value)? loading,
    TResult Function(PriceTCGSuccess value)? success,
    TResult Function(PriceTCGFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PriceTCGFailure implements PriceTCGState {
  const factory PriceTCGFailure(final String error) = _$PriceTCGFailureImpl;

  String get error;

  /// Create a copy of PriceTCGState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceTCGFailureImplCopyWith<_$PriceTCGFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
