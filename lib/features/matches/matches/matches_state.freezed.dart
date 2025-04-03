// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matches_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MatchesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MatchModel> allMatches) success,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<MatchModel> allMatches)? success,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MatchModel> allMatches)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesLoading value) loading,
    required TResult Function(MatchesSuccess value) success,
    required TResult Function(MatchesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesLoading value)? loading,
    TResult? Function(MatchesSuccess value)? success,
    TResult? Function(MatchesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesLoading value)? loading,
    TResult Function(MatchesSuccess value)? success,
    TResult Function(MatchesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchesStateCopyWith<$Res> {
  factory $MatchesStateCopyWith(
          MatchesState value, $Res Function(MatchesState) then) =
      _$MatchesStateCopyWithImpl<$Res, MatchesState>;
}

/// @nodoc
class _$MatchesStateCopyWithImpl<$Res, $Val extends MatchesState>
    implements $MatchesStateCopyWith<$Res> {
  _$MatchesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MatchesLoadingImplCopyWith<$Res> {
  factory _$$MatchesLoadingImplCopyWith(_$MatchesLoadingImpl value,
          $Res Function(_$MatchesLoadingImpl) then) =
      __$$MatchesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MatchesLoadingImplCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesLoadingImpl>
    implements _$$MatchesLoadingImplCopyWith<$Res> {
  __$$MatchesLoadingImplCopyWithImpl(
      _$MatchesLoadingImpl _value, $Res Function(_$MatchesLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MatchesLoadingImpl implements MatchesLoading {
  const _$MatchesLoadingImpl();

  @override
  String toString() {
    return 'MatchesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MatchesLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MatchModel> allMatches) success,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<MatchModel> allMatches)? success,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MatchModel> allMatches)? success,
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
    required TResult Function(MatchesLoading value) loading,
    required TResult Function(MatchesSuccess value) success,
    required TResult Function(MatchesFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesLoading value)? loading,
    TResult? Function(MatchesSuccess value)? success,
    TResult? Function(MatchesFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesLoading value)? loading,
    TResult Function(MatchesSuccess value)? success,
    TResult Function(MatchesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MatchesLoading implements MatchesState {
  const factory MatchesLoading() = _$MatchesLoadingImpl;
}

/// @nodoc
abstract class _$$MatchesSuccessImplCopyWith<$Res> {
  factory _$$MatchesSuccessImplCopyWith(_$MatchesSuccessImpl value,
          $Res Function(_$MatchesSuccessImpl) then) =
      __$$MatchesSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MatchModel> allMatches});
}

/// @nodoc
class __$$MatchesSuccessImplCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesSuccessImpl>
    implements _$$MatchesSuccessImplCopyWith<$Res> {
  __$$MatchesSuccessImplCopyWithImpl(
      _$MatchesSuccessImpl _value, $Res Function(_$MatchesSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allMatches = null,
  }) {
    return _then(_$MatchesSuccessImpl(
      null == allMatches
          ? _value._allMatches
          : allMatches // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>,
    ));
  }
}

/// @nodoc

class _$MatchesSuccessImpl implements MatchesSuccess {
  const _$MatchesSuccessImpl(final List<MatchModel> allMatches)
      : _allMatches = allMatches;

  final List<MatchModel> _allMatches;
  @override
  List<MatchModel> get allMatches {
    if (_allMatches is EqualUnmodifiableListView) return _allMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allMatches);
  }

  @override
  String toString() {
    return 'MatchesState.success(allMatches: $allMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._allMatches, _allMatches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_allMatches));

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesSuccessImplCopyWith<_$MatchesSuccessImpl> get copyWith =>
      __$$MatchesSuccessImplCopyWithImpl<_$MatchesSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MatchModel> allMatches) success,
    required TResult Function(String error) failure,
  }) {
    return success(allMatches);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<MatchModel> allMatches)? success,
    TResult? Function(String error)? failure,
  }) {
    return success?.call(allMatches);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MatchModel> allMatches)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(allMatches);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchesLoading value) loading,
    required TResult Function(MatchesSuccess value) success,
    required TResult Function(MatchesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesLoading value)? loading,
    TResult? Function(MatchesSuccess value)? success,
    TResult? Function(MatchesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesLoading value)? loading,
    TResult Function(MatchesSuccess value)? success,
    TResult Function(MatchesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class MatchesSuccess implements MatchesState {
  const factory MatchesSuccess(final List<MatchModel> allMatches) =
      _$MatchesSuccessImpl;

  List<MatchModel> get allMatches;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchesSuccessImplCopyWith<_$MatchesSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MatchesFailureImplCopyWith<$Res> {
  factory _$$MatchesFailureImplCopyWith(_$MatchesFailureImpl value,
          $Res Function(_$MatchesFailureImpl) then) =
      __$$MatchesFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$MatchesFailureImplCopyWithImpl<$Res>
    extends _$MatchesStateCopyWithImpl<$Res, _$MatchesFailureImpl>
    implements _$$MatchesFailureImplCopyWith<$Res> {
  __$$MatchesFailureImplCopyWithImpl(
      _$MatchesFailureImpl _value, $Res Function(_$MatchesFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$MatchesFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MatchesFailureImpl implements MatchesFailure {
  const _$MatchesFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'MatchesState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchesFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchesFailureImplCopyWith<_$MatchesFailureImpl> get copyWith =>
      __$$MatchesFailureImplCopyWithImpl<_$MatchesFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MatchModel> allMatches) success,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<MatchModel> allMatches)? success,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MatchModel> allMatches)? success,
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
    required TResult Function(MatchesLoading value) loading,
    required TResult Function(MatchesSuccess value) success,
    required TResult Function(MatchesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MatchesLoading value)? loading,
    TResult? Function(MatchesSuccess value)? success,
    TResult? Function(MatchesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchesLoading value)? loading,
    TResult Function(MatchesSuccess value)? success,
    TResult Function(MatchesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class MatchesFailure implements MatchesState {
  const factory MatchesFailure(final String error) = _$MatchesFailureImpl;

  String get error;

  /// Create a copy of MatchesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MatchesFailureImplCopyWith<_$MatchesFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
