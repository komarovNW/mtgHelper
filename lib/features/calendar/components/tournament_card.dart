import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/exchange_extension.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';

class TournamentCards extends StatelessWidget {
  const TournamentCards({
    super.key,
    required this.selectedDay,
  });

  final DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Builder(
        builder: (BuildContext context) {
          if (selectedDay == null) {
            return Center(child: Text(context.l10n.calendarChooseDate));
          }
          final List<Events> tournaments =
              context.read<CalendarCubit>().getTournamentsForDay(selectedDay!);
          if (tournaments.isEmpty) {
            return Center(child: Text(context.l10n.calendarNoTournaments));
          }
          return ListView.builder(
            itemCount: tournaments.length,
            itemBuilder: (BuildContext context, int index) {
              final Events tournament = tournaments[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    // '${tournament.format.formatName} — ${tournament.club.clubName}',
                    '${tournament.format.formatName} — ${tournament.club}',
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Text>[
                      Text(
                        // '${context.l10n.calendarCity}${tournament.city.cityName}',
                        '${context.l10n.calendarCity}${tournament.city}',
                      ),
                      Text(
                        '${context.l10n.calendarTime}${tournament.time.format(context)}',
                      ),
                      Text(
                        '${context.l10n.calendarPrice}${tournament.price.toStringAsFixed(0)}'
                            .withRub,
                      ),
                      if (tournament.comment != null)
                        Text(
                          '${context.l10n.calendarCommit}${tournament.comment}',
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
