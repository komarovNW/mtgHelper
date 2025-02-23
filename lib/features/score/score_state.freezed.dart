// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScoreState {
  int get player1Health => throw _privateConstructorUsedError;
  int get player2Health => throw _privateConstructorUsedError;
  bool get showResetDialog => throw _privateConstructorUsedError;

  /// Create a copy of ScoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreStateCopyWith<ScoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreStateCopyWith<$Res> {
  factory $ScoreStateCopyWith(
          ScoreState value, $Res Function(ScoreState) then) =
      _$ScoreStateCopyWithImpl<$Res, ScoreState>;
  @useResult
  $Res call({int player1Health, int player2Health, bool showResetDialog});
}

/// @nodoc
class _$ScoreStateCopyWithImpl<$Res, $Val extends ScoreState>
    implements $ScoreStateCopyWith<$Res> {
  _$ScoreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player1Health = null,
    Object? player2Health = null,
    Object? showResetDialog = null,
  }) {
    return _then(_value.copyWith(
      player1Health: null == player1Health
          ? _value.player1Health
          : player1Health // ignore: cast_nullable_to_non_nullable
              as int,
      player2Health: null == player2Health
          ? _value.player2Health
          : player2Health // ignore: cast_nullable_to_non_nullable
              as int,
      showResetDialog: null == showResetDialog
          ? _value.showResetDialog
          : showResetDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreStateImplCopyWith<$Res>
    implements $ScoreStateCopyWith<$Res> {
  factory _$$ScoreStateImplCopyWith(
          _$ScoreStateImpl value, $Res Function(_$ScoreStateImpl) then) =
      __$$ScoreStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int player1Health, int player2Health, bool showResetDialog});
}

/// @nodoc
class __$$ScoreStateImplCopyWithImpl<$Res>
    extends _$ScoreStateCopyWithImpl<$Res, _$ScoreStateImpl>
    implements _$$ScoreStateImplCopyWith<$Res> {
  __$$ScoreStateImplCopyWithImpl(
      _$ScoreStateImpl _value, $Res Function(_$ScoreStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player1Health = null,
    Object? player2Health = null,
    Object? showResetDialog = null,
  }) {
    return _then(_$ScoreStateImpl(
      player1Health: null == player1Health
          ? _value.player1Health
          : player1Health // ignore: cast_nullable_to_non_nullable
              as int,
      player2Health: null == player2Health
          ? _value.player2Health
          : player2Health // ignore: cast_nullable_to_non_nullable
              as int,
      showResetDialog: null == showResetDialog
          ? _value.showResetDialog
          : showResetDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScoreStateImpl implements _ScoreState {
  const _$ScoreStateImpl(
      {required this.player1Health,
      required this.player2Health,
      this.showResetDialog = false});

  @override
  final int player1Health;
  @override
  final int player2Health;
  @override
  @JsonKey()
  final bool showResetDialog;

  @override
  String toString() {
    return 'ScoreState(player1Health: $player1Health, player2Health: $player2Health, showResetDialog: $showResetDialog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreStateImpl &&
            (identical(other.player1Health, player1Health) ||
                other.player1Health == player1Health) &&
            (identical(other.player2Health, player2Health) ||
                other.player2Health == player2Health) &&
            (identical(other.showResetDialog, showResetDialog) ||
                other.showResetDialog == showResetDialog));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, player1Health, player2Health, showResetDialog);

  /// Create a copy of ScoreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreStateImplCopyWith<_$ScoreStateImpl> get copyWith =>
      __$$ScoreStateImplCopyWithImpl<_$ScoreStateImpl>(this, _$identity);
}

abstract class _ScoreState implements ScoreState {
  const factory _ScoreState(
      {required final int player1Health,
      required final int player2Health,
      final bool showResetDialog}) = _$ScoreStateImpl;

  @override
  int get player1Health;
  @override
  int get player2Health;
  @override
  bool get showResetDialog;

  /// Create a copy of ScoreState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreStateImplCopyWith<_$ScoreStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
