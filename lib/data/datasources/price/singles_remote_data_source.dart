import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/utils/api_constants.dart';

class SinglesRemoteDataSource {
  SinglesRemoteDataSource({required DioService dioService})
      : _dioService = dioService;

  final DioService _dioService;

  Future<List<SinglesCardModel>> getSingles(
    String name,
    String? localizationName,
  ) async {
    try {
      final List<SinglesCardModel> allCards = <SinglesCardModel>[];
      await _fetchAndAddCards(allCards, name);
      if (localizationName?.isNotEmpty ?? false) {
        await _fetchAndAddCards(allCards, localizationName!);
      }
      return allCards;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _fetchAndAddCards(
    List<SinglesCardModel> allCards,
    String query,
  ) async {
    final Response<dynamic> response = await _dioService.get(
      ApiConstants.topdeckSingles,
      queryParameters: <String, dynamic>{'q': query},
    );
    final List<dynamic> data = response.data as List<dynamic>;
    allCards.addAll(
      data.map(
        (dynamic json) =>
            SinglesCardModel.fromJson(json as Map<String, dynamic>),
      ),
    );
  }
}
