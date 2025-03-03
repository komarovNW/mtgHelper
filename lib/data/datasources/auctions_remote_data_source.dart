import 'package:dio/dio.dart';
import 'package:mtg_helper/data/models/auction_model.dart';

class AuctionsRemoteDataSource {
  AuctionsRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<List<AuctionModel>> getAuctions() async {
    try {
      final Response<dynamic> response = await _dio.get(
        'https://topdeck.ru/apps/toptrade/api-v1/auctions',
      );

      final List<dynamic> data = response.data as List<dynamic>;

      return data
          .map(
            (dynamic json) =>
                AuctionModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load auctions: $e');
    }
  }
}
