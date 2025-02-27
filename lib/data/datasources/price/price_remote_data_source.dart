import 'package:dio/dio.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';

class PriceRemoteDataSource {
  PriceRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<List<SearchCardModel>> getPrice(String query) async {
    try {
      final Response<dynamic> response = await _dio.get(
        'https://scg.dekker.lol/api/suggest?name=$query',
      );

      final Map<String, dynamic> data = response.data as Map<String, dynamic>;

      return data.values
          .map(
            (dynamic json) =>
                SearchCardModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load auctions: $e');
    }
  }
}
