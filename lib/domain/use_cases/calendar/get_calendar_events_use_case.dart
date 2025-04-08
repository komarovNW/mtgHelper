import 'package:mtg_helper/domain/repositories/calendar_repository.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';

class GetCalendarEventsUseCase {
  GetCalendarEventsUseCase({required CalendarRepository repository})
      : _repository = repository;
  final CalendarRepository _repository;

  Future<List<Events>> call() async {
    try {
      return await _repository.getCalendarEvents();
    } catch (e) {
      rethrow;
    }
  }
}
