import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/utils/api_constants.dart';

class AuctionsRemoteDataSource {
  AuctionsRemoteDataSource({required DioService dioService})
      : _dioService = dioService;
  final DioService _dioService;
  Future<List<AuctionModel>> getAuctions() async {
    try {
      final Response<dynamic> response = await _dioService.get(
        ApiConstants.topdeckAuctions,
      );
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map(
            (dynamic json) =>
                AuctionModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
