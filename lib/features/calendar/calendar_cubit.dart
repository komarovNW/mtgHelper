import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/domain/use_cases/calendar/get_calendar_events_use_case.dart';

import 'package:mtg_helper/features/calendar/calendar_page.dart';
import 'package:mtg_helper/utils/enums/format.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit({
    required GetCalendarEventsUseCase getCalendarEventsUseCase,
  })  : _getCalendarEventsUseCase = getCalendarEventsUseCase,
        super(const CalendarState());

  final GetCalendarEventsUseCase _getCalendarEventsUseCase;

  List<Events> tournaments = <Events>[];

  void loadTournaments() async {
    tournaments = await _getCalendarEventsUseCase();
    emit(
      state.copyWith(
        allTournaments: tournaments,
        selectedFormats: Format.values.toSet(),
      ),
    );
  }

  void toggleFormat(Format format) {
    final Set<Format> formats = Set<Format>.from(state.selectedFormats);
    if (formats.contains(format)) {
      formats.remove(format);
    } else {
      formats.add(format);
    }
    emit(state.copyWith(selectedFormats: formats));
  }

  void selectCity(String? city) {
    emit(state.copyWith(selectedCity: city));
  }

  List<Events> getTournamentsForDay(DateTime date) {
    return tournaments.where((Events tournament) {
      if (tournament.specialTournamentDate != null) {
        return isSameDay(tournament.specialTournamentDate!, date);
      }

      if (tournament.weekday != null) {
        final Weekday currentWeekday = Weekday.values[date.weekday - 1];
        return tournament.weekday == currentWeekday;
      }

      return false;
    }).toList();
  }

  // List<String> get availableCities => state.allTournaments.map((Events e) => e.city.cityName).toSet().toList();
}
