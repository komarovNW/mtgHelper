import 'package:flutter/material.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_state.dart';
import 'package:mtg_helper/utils/enums/format.dart';

class FilterFormat extends StatelessWidget {
  const FilterFormat({
    super.key,
    required this.state,
    required this.cubit,
  });

  final CalendarState state;
  final CalendarCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: Format.values.map(
        (Format format) {
          return FilterChip(
            label: Text(format.name),
            selected: state.selectedFormats.contains(format),
            backgroundColor: format.formatColor,
            selectedColor: format.formatColor,
            onSelected: (_) => cubit.toggleFormat(format),
          );
        },
      ).toList(),
    );
  }
}
