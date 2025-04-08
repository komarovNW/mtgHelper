import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/match.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';

class MatchesRemoteDataSource {
  MatchesRemoteDataSource({
    required DioService dioService,
    required AuthChangeNotifier authChangeNotifier,
  })  : _dioService = dioService,
        _authChangeNotifier = authChangeNotifier;
  final DioService _dioService;
  final AuthChangeNotifier _authChangeNotifier;
  Future<List<MatchModel>> getMatches() async {
    try {
      final String? idToken = await _authChangeNotifier.getId();

      if (idToken == null) {
        throw Exception('Пользователь не авторизован');
      }

      final Response<dynamic> response = await _dioService.get(
        'https://us-central1-sampleMtgHelper.cloudfunctions.net/getMatches',
        headers: <String, String>{
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data
            .map(
              (dynamic json) =>
                  MatchModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Ошибка при получении матча: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addMatch(MatchModel match) async {
    try {
      final String? idToken = await _authChangeNotifier.getId();
      if (idToken == null) {
        throw Exception('Пользователь не авторизован');
      }

      await _dioService.post(
        'https://us-central1-sampleMtgHelper.cloudfunctions.net/addMatch',
        headers: <String, String>{
          'Authorization': 'Bearer $idToken',
          'Content-Type': 'application/json',
        },
        data: match.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteMatch(String id) async {
    try {
      final String? idToken = await _authChangeNotifier.getId();
      if (idToken == null) {
        throw Exception('Пользователь не авторизован');
      }
      final Response<dynamic> response = await _dioService.delete(
        'https://us-central1-sampleMtgHelper.cloudfunctions.net/deleteMatch',
        headers: <String, String>{
          'Authorization': 'Bearer $idToken',
        },
        data: <String, dynamic>{
          'matchId': id,
        },
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Ошибка при удалении матча: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
