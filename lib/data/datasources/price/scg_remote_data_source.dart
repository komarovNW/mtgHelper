import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';

import 'package:mtg_helper/data/models/scg_request.dart';
import 'package:mtg_helper/utils/api_constants.dart';

class SCGRemoteDataSource {
  SCGRemoteDataSource({required DioService dioService})
      : _dioService = dioService;

  final DioService _dioService;

  Future<List<ScgCardsModel>> getSCG(String query) async {
    try {
      final Response<dynamic> response = await _dioService.post(
        ApiConstants.hawkSearch,
        data: SCGRequest(
          keyword: query,
          variant: Variant(maxPerPage: 96),
          maxPerPage: 96,
          facetSelections: FacetSelections(cardName: query),
          clientGuid: 'cc3be22005ef47d3969c3de28f09571b',
        ).toJson(),
      );
      final ScgCardsResponse cards = ScgCardsResponse.fromJson(response.data);
      return cards.cards;
    } catch (e) {
      rethrow;
    }
  }
}
