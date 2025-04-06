import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_state.dart';
import 'package:mtg_helper/features/calendar/components/calendar.dart';
import 'package:mtg_helper/features/calendar/components/tournament_card.dart';

import 'package:mtg_helper/utils/enums/format.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: TitleWidget(
          title: context.l10n.calendar,
        ),
        actions: const <Widget>[FormatLegendButton()],
      ),
      drawer: AppDrawer(
        currentPage: context.l10n.drawerCalendar,
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    context.read<CalendarCubit>().loadTournaments();
    super.initState();
  }

  _onDaySelected(DateTime selected, DateTime focused) {
    setState(() {
      _selectedDay = selected;
      _focusedDay = focused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (BuildContext context, CalendarState state) {
        return Column(
          children: <Widget>[
            Calendar(
              focusedDay: _focusedDay,
              selectedDay: _selectedDay,
              onDaySelected: _onDaySelected,
            ),
            const HBox(8),
            TournamentCards(
              selectedDay: _selectedDay,
            ),
          ],
        );
      },
    );
  }
}

class FormatLegendButton extends StatelessWidget {
  const FormatLegendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Format>(
      tooltip: context.l10n.calendarFormatTournament,
      color: Colors.white,
      offset: const Offset(-60, 0),
      itemBuilder: (BuildContext context) {
        return Format.values.map((Format format) {
          return PopupMenuItem<Format>(
            enabled: false,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: format.formatColor,
                  ),
                ),
                Text(
                  format.formatName,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: const Padding(
        padding: EdgeInsets.only(top: 15.0, right: 20),
        child: Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}

class Tournament {
  Tournament({
    required this.format,
    required this.club,
    required this.city,
    required this.time,
    required this.price,
    this.weekday,
    this.specialTournamentDate,
    this.comment,
  });
  final Format format;
  final Club club;
  final City city;
  final TimeOfDay time;
  final double price;
  final Weekday? weekday;
  final DateTime? specialTournamentDate;
  final String? comment;
}

enum City {
  moscow(cityName: 'Москва');

  const City({required this.cityName});

  final String cityName;
}

enum Club {
  edinorog(clubName: 'Единорог'),
  goldfish(clubName: 'GoldFish'),
  portal(clubName: 'Портал');

  const Club({required this.clubName});

  final String clubName;
}

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}
