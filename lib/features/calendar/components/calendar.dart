import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar<Object?>(
      locale: 'ru_RU',
      firstDay: DateTime.utc(2000),
      lastDay: DateTime.utc(2040),
      focusedDay: focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      selectedDayPredicate: (DateTime day) => isSameDay(day, selectedDay),
      onDaySelected: onDaySelected,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(),
        todayTextStyle: TextStyle(),
        selectedDecoration: BoxDecoration(),
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      availableCalendarFormats: <CalendarFormat, String>{
        CalendarFormat.month: context.l10n.month,
      },
      calendarBuilders: CalendarBuilders<Object?>(
        markerBuilder: (BuildContext context, DateTime date, _) {
          final List<Tournament> tournaments =
              context.read<CalendarCubit>().getTournamentsForDay(date);
          if (tournaments.isEmpty) return null;
          return CalendarMarker(
            tournaments: tournaments,
          );
        },
      ),
    );
  }
}

class CalendarMarker extends StatelessWidget {
  const CalendarMarker({
    super.key,
    required this.tournaments,
  });

  final List<Tournament> tournaments;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: tournaments
            .map(
              (Tournament tournament) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                width: tournament.specialTournamentDate != null ? 12 : 6,
                height: tournament.specialTournamentDate != null ? 12 : 6,
                decoration: BoxDecoration(
                  color: tournament.format.formatColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
