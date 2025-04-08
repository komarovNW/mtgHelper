import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/features/calendar/calendar_page.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';

class CalendarRemoteDataSource {
  CalendarRemoteDataSource({
    required DioService dioService,
    required AuthChangeNotifier authChangeNotifier,
  })  : _dioService = dioService,
        _authChangeNotifier = authChangeNotifier;
  final DioService _dioService;
  final AuthChangeNotifier _authChangeNotifier;
  Future<List<Events>> getCalendarEvents() async {
    try {
      final String? idToken = await _authChangeNotifier.getId();
      if (idToken == null) {
        throw Exception('Пользователь не авторизован');
      }
      final Response<dynamic> response = await _dioService.get(
        'https://us-central1-sampleMtgHelper.cloudfunctions.net/getCalendarEvents',
        headers: <String, String>{
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;

        return data
            .map(
              (dynamic json) => Events.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Ошибка при получении матча: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
