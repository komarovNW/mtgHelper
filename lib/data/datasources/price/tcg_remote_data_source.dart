import 'package:dio/dio.dart';

import 'package:mtg_helper/data/models/scryfall_card_model.dart';

class TCGRemoteDataSource {
  TCGRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<List<ScryfallCardModel>> getTCG(String query) async {
    try {
      final Response<dynamic> response = await _dio.get(
        'https://api.scryfall.com/cards/search',
        queryParameters: <String, dynamic>{
          'q': query,
          'unique': 'prints',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] as List<dynamic>;
        return data
            .map(
              (dynamic json) =>
                  ScryfallCardModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw Exception('Failed to load cards: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load auctions: $e');
    }
  }
}
