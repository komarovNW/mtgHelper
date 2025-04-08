import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_state.dart';

class FilterCity extends StatelessWidget {
  const FilterCity({
    super.key,
    required this.state,
    required this.cubit,
  });

  final CalendarState state;
  final CalendarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButton<String>(
        value: state.selectedCity,
        isExpanded: true,
        hint: Text(context.l10n.calendarChooseCity),
        onChanged: cubit.selectCity,
        items: <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            child: Text(context.l10n.calendarAllCites),
          ),
          // ...cubit.availableCities.map(
          //   (String city) => DropdownMenuItem<String>(
          //     value: city,
          //     child: Text(city),
          //   ),
          // ),
        ],
      ),
    );
  }
}
