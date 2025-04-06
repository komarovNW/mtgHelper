import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';

class CalendarFactory {
  CalendarFactory();

  CalendarCubit createCalendarCubit() {
    return CalendarCubit();
  }

  BlocProvider<CalendarCubit> createCalendarBlocProvider() {
    return BlocProvider<CalendarCubit>(
      create: (_) => createCalendarCubit(),
      child: const CalendarPage(),
    );
  }
}
