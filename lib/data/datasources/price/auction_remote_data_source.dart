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
    final List<AuctionModel> x;
    final List<PastAuctionModel> y;
    try {
      x = await _fetchCurrentAuctions(
        name: name,
        localizationName: localizationName,
      );
    } catch (e) {
      rethrow;
    }
    try {
      y = await _fetchPastAuctions(
        name: name,
        localizationName: localizationName,
      );
    } catch (e) {
      rethrow;
    }
    return AllAuctionsModel(
      currentAuctions: x.reversed.toList(),
      pastAuctions: y,
    );
  }

  Future<List<AuctionModel>> _fetchCurrentAuctions({
    required String name,
    String? localizationName,
  }) async {
    final Response<dynamic> responseCurrentAuc =
        await _dioService.get(ApiConstants.topdeckAuctions);
    final List<dynamic> dataCurrentAuc =
        responseCurrentAuc.data as List<dynamic>;
    final List<AuctionModel> auctionCurrentAucList =
        dataCurrentAuc.map((dynamic json) {
      return AuctionModel.fromJson(json as Map<String, dynamic>);
    }).toList();

    return _filterAuctions<AuctionModel>(
      auctionCurrentAucList,
      name,
      localizationName,
    );
  }

  Future<List<PastAuctionModel>> _fetchPastAuctions({
    required String name,
    String? localizationName,
  }) async {
    final List<String> queries = <String>[name];
    if (localizationName?.isNotEmpty ?? false) {
      queries.add(localizationName!);
    }

    final List<PastAuctionModel> list = <PastAuctionModel>[];

    for (final String query in queries) {
      final Response<dynamic> response = await _dioService.get(
        ApiConstants.topdeckAuctionSearch,
        queryParameters: <String, dynamic>{'q': query},
      );
      final PastAuctionDataModelResponse data =
          PastAuctionDataModelResponse.fromJson(response.data);
      list.addAll(data.auctions);
    }

    return _filterAuctions<PastAuctionModel>(list, name, localizationName);
  }
}

List<T> _filterAuctions<T>(
  List<T> auctions,
  String name,
  String? localizationName,
) {
  return auctions.where((T item) {
    final String lot = item is AuctionModel
        ? item.lot.toLowerCase()
        : (item as PastAuctionModel).lot.toLowerCase();
    final bool matchesName = lot.contains(name.toLowerCase());
    final bool matchesLocalization = localizationName?.isNotEmpty ?? false
        ? lot.contains(localizationName!.toLowerCase())
        : false;
    return matchesName || matchesLocalization;
  }).toList();
}
