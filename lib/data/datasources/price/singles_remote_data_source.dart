import 'package:dio/dio.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';

class SinglesRemoteDataSource {
  SinglesRemoteDataSource({required Dio dio}) : _dio = dio;
  final Dio _dio;
  Future<List<SinglesCardModel>> getSingles(
    String name,
    String? localizationName,
  ) async {
    try {
      final List<SinglesCardModel> allCards = <SinglesCardModel>[];

      final Response<dynamic> responseName = await _dio.get(
        'https://topdeck.ru/apps/toptrade/api-v1/singles/search',
        queryParameters: <String, dynamic>{'q': name},
      );

      if (responseName.statusCode == 200) {
        final List<dynamic> data = responseName.data as List<dynamic>;
        allCards.addAll(
          data
              .map(
                (dynamic json) =>
                    SinglesCardModel.fromJson(json as Map<String, dynamic>),
              )
              .where(
                (SinglesCardModel card) =>
                    card.name.toLowerCase() == name.toLowerCase(),
              ),
        );
      } else {
        throw Exception(
          'Failed to load cards for name: ${responseName.statusCode}',
        );
      }

      if (localizationName != null && localizationName.isNotEmpty) {
        final Response<dynamic> responseLocalization = await _dio.get(
          'https://topdeck.ru/apps/toptrade/api-v1/singles/search',
          queryParameters: <String, dynamic>{'q': localizationName},
        );

        if (responseLocalization.statusCode == 200) {
          final List<dynamic> data = responseLocalization.data as List<dynamic>;
          allCards.addAll(
            data
                .map(
                  (dynamic json) =>
                      SinglesCardModel.fromJson(json as Map<String, dynamic>),
                )
                .where(
                  (SinglesCardModel card) =>
                      card.name.toLowerCase() == localizationName.toLowerCase(),
                ),
          );
        } else {
          throw Exception(
            'Failed to load cards for localizationName: ${responseLocalization.statusCode}',
          );
        }
      }
      allCards.sort(
        (SinglesCardModel a, SinglesCardModel b) => a.cost.compareTo(b.cost),
      );

      return allCards;
    } catch (e) {
      throw Exception('Failed to load cards: $e');
    }
  }
}
