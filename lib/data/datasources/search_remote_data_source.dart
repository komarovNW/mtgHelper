import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/utils/api_constants.dart';

class SearchRemoteDataSource {
  SearchRemoteDataSource({required DioService dioService})
      : _dioService = dioService;

  final DioService _dioService;

  Future<List<SearchCardModel>> getListOfSearchCards(String query) async {
    try {
      final Response<dynamic> response = await _dioService.get(
        '${ApiConstants.dekkerSearch}$query',
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
