import 'package:mtg_helper/features/calendar/calendar_page.dart';

abstract class CalendarRepository {
  Future<List<Events>> getCalendarEvents();
}
