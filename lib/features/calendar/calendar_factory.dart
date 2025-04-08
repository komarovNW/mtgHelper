import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/datasources/calendar_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/calendar_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/calendar_repository.dart';
import 'package:mtg_helper/domain/use_cases/calendar/get_calendar_events_use_case.dart';
import 'package:mtg_helper/features/calendar/calendar_cubit.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';

class CalendarFactory {
  CalendarFactory({required this.dioService});

  final DioService dioService;

  AuthChangeNotifier createAuthChangeNotifier() {
    return AuthChangeNotifier();
  }

  CalendarRemoteDataSource createCalendarRemoteDataSource() {
    return CalendarRemoteDataSource(
      dioService: dioService,
      authChangeNotifier: createAuthChangeNotifier(),
    );
  }

  CalendarRepository createCalendarRepository() {
    return CalendarRepositoryImpl(
      remoteDataSource: createCalendarRemoteDataSource(),
    );
  }

  GetCalendarEventsUseCase createGetCalendarEventsUseCase() {
    return GetCalendarEventsUseCase(repository: createCalendarRepository());
  }

  CalendarCubit createCalendarCubit() {
    return CalendarCubit(
      getCalendarEventsUseCase: createGetCalendarEventsUseCase(),
    );
  }

  BlocProvider<CalendarCubit> createCalendarBlocProvider() {
    return BlocProvider<CalendarCubit>(
      create: (_) => createCalendarCubit(),
      child: const CalendarPage(),
    );
  }
}
