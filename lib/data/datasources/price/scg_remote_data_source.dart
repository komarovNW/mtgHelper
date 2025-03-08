import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';

class SCGRemoteDataSource {
  SCGRemoteDataSource({required DioService dioService})
      : _dioService = dioService;

  final DioService _dioService;
  List<SCGCardModel> allCards = <SCGCardModel>[];
  int page = 1;
  int pageCount = 1;

  Future<List<SCGCardModel>> getSCG(String query) async {
    try {
      final Response<dynamic> response = await _dioService.get(
        'https://essearchapi-na.hawksearch.com/api/v2/',
        queryParameters: <String, dynamic>{
          'Keyword': 'tarmogoyf',
          'Variant': json.encode(<String, int>{'MaxPerPage': 32}),
          'MaxPerPage': 32,
          'FacetSelections': json.encode(<String, List<String>>{
            'card_name': <String>['tarmogoyf'],
          }),
          'clientguid': 'cc3be22005ef47d3969c3de28f09571b',
        },
      );

      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data
          .map(
            (dynamic json) =>
                SCGCardModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
