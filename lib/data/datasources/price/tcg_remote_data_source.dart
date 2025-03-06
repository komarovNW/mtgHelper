import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';

import 'package:mtg_helper/data/models/scryfall_card_model.dart';
import 'package:mtg_helper/utils/api_constants.dart';

class TCGRemoteDataSource {
  TCGRemoteDataSource({required DioService dioService})
      : _dioService = dioService;

  final DioService _dioService;

  Future<List<ScryfallCardModel>> getTCG(String query) async {
    try {
      final Response<dynamic> response = await _dioService.get(
        ApiConstants.tcgSearch,
        queryParameters: <String, dynamic>{
          'q': query,
          'unique': 'prints',
        },
      );

      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data
          .map(
            (dynamic json) =>
                ScryfallCardModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
