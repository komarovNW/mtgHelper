// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarState {
  List<Tournament> get allTournaments => throw _privateConstructorUsedError;
  Set<Format> get selectedFormats => throw _privateConstructorUsedError;
  String? get selectedCity => throw _privateConstructorUsedError;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call(
      {List<Tournament> allTournaments,
      Set<Format> selectedFormats,
      String? selectedCity});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTournaments = null,
    Object? selectedFormats = null,
    Object? selectedCity = freezed,
  }) {
    return _then(_value.copyWith(
      allTournaments: null == allTournaments
          ? _value.allTournaments
          : allTournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      selectedFormats: null == selectedFormats
          ? _value.selectedFormats
          : selectedFormats // ignore: cast_nullable_to_non_nullable
              as Set<Format>,
      selectedCity: freezed == selectedCity
          ? _value.selectedCity
          : selectedCity // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarStateImplCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$CalendarStateImplCopyWith(
          _$CalendarStateImpl value, $Res Function(_$CalendarStateImpl) then) =
      __$$CalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Tournament> allTournaments,
      Set<Format> selectedFormats,
      String? selectedCity});
}

/// @nodoc
class __$$CalendarStateImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateImpl>
    implements _$$CalendarStateImplCopyWith<$Res> {
  __$$CalendarStateImplCopyWithImpl(
      _$CalendarStateImpl _value, $Res Function(_$CalendarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTournaments = null,
    Object? selectedFormats = null,
    Object? selectedCity = freezed,
  }) {
    return _then(_$CalendarStateImpl(
      allTournaments: null == allTournaments
          ? _value._allTournaments
          : allTournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      selectedFormats: null == selectedFormats
          ? _value._selectedFormats
          : selectedFormats // ignore: cast_nullable_to_non_nullable
              as Set<Format>,
      selectedCity: freezed == selectedCity
          ? _value.selectedCity
          : selectedCity // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CalendarStateImpl implements _CalendarState {
  const _$CalendarStateImpl(
      {final List<Tournament> allTournaments = const <Tournament>[],
      final Set<Format> selectedFormats = const <Format>{},
      this.selectedCity})
      : _allTournaments = allTournaments,
        _selectedFormats = selectedFormats;

  final List<Tournament> _allTournaments;
  @override
  @JsonKey()
  List<Tournament> get allTournaments {
    if (_allTournaments is EqualUnmodifiableListView) return _allTournaments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTournaments);
  }

  final Set<Format> _selectedFormats;
  @override
  @JsonKey()
  Set<Format> get selectedFormats {
    if (_selectedFormats is EqualUnmodifiableSetView) return _selectedFormats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedFormats);
  }

  @override
  final String? selectedCity;

  @override
  String toString() {
    return 'CalendarState(allTournaments: $allTournaments, selectedFormats: $selectedFormats, selectedCity: $selectedCity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allTournaments, _allTournaments) &&
            const DeepCollectionEquality()
                .equals(other._selectedFormats, _selectedFormats) &&
            (identical(other.selectedCity, selectedCity) ||
                other.selectedCity == selectedCity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTournaments),
      const DeepCollectionEquality().hash(_selectedFormats),
      selectedCity);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      __$$CalendarStateImplCopyWithImpl<_$CalendarStateImpl>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {final List<Tournament> allTournaments,
      final Set<Format> selectedFormats,
      final String? selectedCity}) = _$CalendarStateImpl;

  @override
  List<Tournament> get allTournaments;
  @override
  Set<Format> get selectedFormats;
  @override
  String? get selectedCity;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
