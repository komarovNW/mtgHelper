import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';

class PriceAuctionRemoteDataSource {
  PriceAuctionRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

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
      throw Exception('_fetchCurrentAuctions: $e');
    }
    try {
      y = await _fetchPastAuctions(
        name: name,
        localizationName: localizationName,
      );
    } catch (e) {
      throw Exception('_fetchPastAuctions: $e');
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
    try {
      final Response<dynamic> responseCurrentAuc =
          await _dio.get('https://topdeck.ru/apps/toptrade/api-v1/auctions');
      final List<dynamic> dataCurrentAuc =
          responseCurrentAuc.data as List<dynamic>;

      final List<AuctionModel> auctionCurrentAucList =
          dataCurrentAuc.map((dynamic json) {
        try {
          return AuctionModel.fromJson(json as Map<String, dynamic>);
        } catch (e) {
          debugPrint(
            '_fetchCurrentAuctions Ошибка при парсинге AuctionModel: $e',
          );
          debugPrint('_fetchCurrentAuctions Ошибка на ключах: ${json.keys}');
          rethrow;
        }
      }).toList();

      return _filterAuctions<AuctionModel>(
        auctionCurrentAucList,
        name,
        localizationName,
      );
    } catch (e) {
      debugPrint('Ошибка при получении текущих аукционов: $e');
      rethrow;
    }
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
      try {
        final Response<dynamic> response = await _dio.get(
          'https://topdeck.ru/apps/toptrade/api-v1/auctions/search?q=$query',
        );
        final PastAuctionDataModelResponse data =
            PastAuctionDataModelResponse.fromJson(response.data);
        list.addAll(data.auctions);
      } catch (e) {
        debugPrint(
          'Ошибка при получении данных о прошлых аукционах для запроса "$query": $e',
        );
        rethrow;
      }
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
