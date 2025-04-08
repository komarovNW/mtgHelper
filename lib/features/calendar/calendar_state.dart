import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';
import 'package:mtg_helper/utils/enums/format.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(<Events>[]) List<Events> allTournaments,
    @Default(<Format>{}) Set<Format> selectedFormats,
    String? selectedCity,
  }) = _CalendarState;
}
