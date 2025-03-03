// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_singles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceSinglesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SinglesCardModel> list) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SinglesCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SinglesCardModel> list)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PriceSinglesLoading value) loading,
    required TResult Function(PriceSinglesSuccess value) success,
    required TResult Function(PriceSinglesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSinglesLoading value)? loading,
    TResult? Function(PriceSinglesSuccess value)? success,
    TResult? Function(PriceSinglesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSinglesLoading value)? loading,
    TResult Function(PriceSinglesSuccess value)? success,
    TResult Function(PriceSinglesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceSinglesStateCopyWith<$Res> {
  factory $PriceSinglesStateCopyWith(
          PriceSinglesState value, $Res Function(PriceSinglesState) then) =
      _$PriceSinglesStateCopyWithImpl<$Res, PriceSinglesState>;
}

/// @nodoc
class _$PriceSinglesStateCopyWithImpl<$Res, $Val extends PriceSinglesState>
    implements $PriceSinglesStateCopyWith<$Res> {
  _$PriceSinglesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PriceSinglesLoadingImplCopyWith<$Res> {
  factory _$$PriceSinglesLoadingImplCopyWith(_$PriceSinglesLoadingImpl value,
          $Res Function(_$PriceSinglesLoadingImpl) then) =
      __$$PriceSinglesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceSinglesLoadingImplCopyWithImpl<$Res>
    extends _$PriceSinglesStateCopyWithImpl<$Res, _$PriceSinglesLoadingImpl>
    implements _$$PriceSinglesLoadingImplCopyWith<$Res> {
  __$$PriceSinglesLoadingImplCopyWithImpl(_$PriceSinglesLoadingImpl _value,
      $Res Function(_$PriceSinglesLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PriceSinglesLoadingImpl implements PriceSinglesLoading {
  const _$PriceSinglesLoadingImpl();

  @override
  String toString() {
    return 'PriceSinglesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceSinglesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SinglesCardModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SinglesCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SinglesCardModel> list)? success,
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
    required TResult Function(PriceSinglesLoading value) loading,
    required TResult Function(PriceSinglesSuccess value) success,
    required TResult Function(PriceSinglesFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSinglesLoading value)? loading,
    TResult? Function(PriceSinglesSuccess value)? success,
    TResult? Function(PriceSinglesFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSinglesLoading value)? loading,
    TResult Function(PriceSinglesSuccess value)? success,
    TResult Function(PriceSinglesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PriceSinglesLoading implements PriceSinglesState {
  const factory PriceSinglesLoading() = _$PriceSinglesLoadingImpl;
}

/// @nodoc
abstract class _$$PriceSinglesSuccessImplCopyWith<$Res> {
  factory _$$PriceSinglesSuccessImplCopyWith(_$PriceSinglesSuccessImpl value,
          $Res Function(_$PriceSinglesSuccessImpl) then) =
      __$$PriceSinglesSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SinglesCardModel> list});
}

/// @nodoc
class __$$PriceSinglesSuccessImplCopyWithImpl<$Res>
    extends _$PriceSinglesStateCopyWithImpl<$Res, _$PriceSinglesSuccessImpl>
    implements _$$PriceSinglesSuccessImplCopyWith<$Res> {
  __$$PriceSinglesSuccessImplCopyWithImpl(_$PriceSinglesSuccessImpl _value,
      $Res Function(_$PriceSinglesSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$PriceSinglesSuccessImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<SinglesCardModel>,
    ));
  }
}

/// @nodoc

class _$PriceSinglesSuccessImpl implements PriceSinglesSuccess {
  const _$PriceSinglesSuccessImpl({required final List<SinglesCardModel> list})
      : _list = list;

  final List<SinglesCardModel> _list;
  @override
  List<SinglesCardModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'PriceSinglesState.success(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceSinglesSuccessImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceSinglesSuccessImplCopyWith<_$PriceSinglesSuccessImpl> get copyWith =>
      __$$PriceSinglesSuccessImplCopyWithImpl<_$PriceSinglesSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SinglesCardModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return success(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SinglesCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SinglesCardModel> list)? success,
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
    required TResult Function(PriceSinglesLoading value) loading,
    required TResult Function(PriceSinglesSuccess value) success,
    required TResult Function(PriceSinglesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSinglesLoading value)? loading,
    TResult? Function(PriceSinglesSuccess value)? success,
    TResult? Function(PriceSinglesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSinglesLoading value)? loading,
    TResult Function(PriceSinglesSuccess value)? success,
    TResult Function(PriceSinglesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PriceSinglesSuccess implements PriceSinglesState {
  const factory PriceSinglesSuccess(
      {required final List<SinglesCardModel> list}) = _$PriceSinglesSuccessImpl;

  List<SinglesCardModel> get list;

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceSinglesSuccessImplCopyWith<_$PriceSinglesSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PriceSinglesFailureImplCopyWith<$Res> {
  factory _$$PriceSinglesFailureImplCopyWith(_$PriceSinglesFailureImpl value,
          $Res Function(_$PriceSinglesFailureImpl) then) =
      __$$PriceSinglesFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PriceSinglesFailureImplCopyWithImpl<$Res>
    extends _$PriceSinglesStateCopyWithImpl<$Res, _$PriceSinglesFailureImpl>
    implements _$$PriceSinglesFailureImplCopyWith<$Res> {
  __$$PriceSinglesFailureImplCopyWithImpl(_$PriceSinglesFailureImpl _value,
      $Res Function(_$PriceSinglesFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PriceSinglesFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PriceSinglesFailureImpl implements PriceSinglesFailure {
  const _$PriceSinglesFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'PriceSinglesState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceSinglesFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceSinglesFailureImplCopyWith<_$PriceSinglesFailureImpl> get copyWith =>
      __$$PriceSinglesFailureImplCopyWithImpl<_$PriceSinglesFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<SinglesCardModel> list) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<SinglesCardModel> list)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<SinglesCardModel> list)? success,
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
    required TResult Function(PriceSinglesLoading value) loading,
    required TResult Function(PriceSinglesSuccess value) success,
    required TResult Function(PriceSinglesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PriceSinglesLoading value)? loading,
    TResult? Function(PriceSinglesSuccess value)? success,
    TResult? Function(PriceSinglesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PriceSinglesLoading value)? loading,
    TResult Function(PriceSinglesSuccess value)? success,
    TResult Function(PriceSinglesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PriceSinglesFailure implements PriceSinglesState {
  const factory PriceSinglesFailure(final String error) =
      _$PriceSinglesFailureImpl;

  String get error;

  /// Create a copy of PriceSinglesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceSinglesFailureImplCopyWith<_$PriceSinglesFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
