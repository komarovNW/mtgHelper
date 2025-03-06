import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';
import 'package:mtg_helper/utils/api_constants.dart';

class PriceAuctionRemoteDataSource {
  PriceAuctionRemoteDataSource({required DioService dioService})
      : _dioService = dioService;

  final DioService _dioService;

  Future<AllAuctionsModel> getAuctions(
    String name,
    String? localizationName,
  ) async {
    final Future<List<AuctionModel>> currentAuctionsFuture =
        _fetchAuctions<AuctionModel>(
      ApiConstants.topdeckAuctions,
      (dynamic json) => AuctionModel.fromJson(json as Map<String, dynamic>),
    );

    final Future<List<PastAuctionModel>> pastAuctionsFuture =
        _fetchPastAuctions(name, localizationName);

    final List<AuctionModel> currentAuctions =
        await _safeFetch(currentAuctionsFuture);
    final List<PastAuctionModel> pastAuctions =
        await _safeFetch(pastAuctionsFuture);

    return AllAuctionsModel(
      currentAuctions: currentAuctions.reversed.toList(),
      pastAuctions: pastAuctions,
    );
  }

  Future<List<T>> _fetchAuctions<T>(
    String url,
    T Function(dynamic json) fromJson,
  ) async {
    final Response<dynamic> response = await _dioService.get(url);
    final List<dynamic> data = response.data as List<dynamic>;
    return data.map((dynamic json) => fromJson(json)).toList();
  }

  Future<List<PastAuctionModel>> _fetchPastAuctions(
    String name,
    String? localizationName,
  ) async {
    final List<String> queries = <String>[
      name,
      if (localizationName?.isNotEmpty ?? false) localizationName!,
    ];

    final List<PastAuctionModel> pastAuctions = <PastAuctionModel>[];

    for (final String query in queries) {
      final Response<dynamic> response = await _dioService.get(
        ApiConstants.topdeckAuctionSearch,
        queryParameters: <String, dynamic>{'q': query},
      );
      final PastAuctionDataModelResponse data =
          PastAuctionDataModelResponse.fromJson(response.data);
      pastAuctions.addAll(data.auctions);
    }
    return pastAuctions;
  }

  Future<List<T>> _safeFetch<T>(Future<List<T>> fetch) async {
    try {
      return await fetch;
    } catch (e) {
      rethrow;
    }
  }
}
