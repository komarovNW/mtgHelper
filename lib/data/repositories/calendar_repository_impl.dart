import 'package:mtg_helper/data/datasources/calendar_remote_data_source.dart';

import 'package:mtg_helper/domain/repositories/calendar_repository.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl({
    required CalendarRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final CalendarRemoteDataSource _remoteDataSource;

  @override
  Future<List<Events>> getCalendarEvents() {
    try {
      return _remoteDataSource.getCalendarEvents();
    } catch (e) {
      rethrow;
    }
  }
}
