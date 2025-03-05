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
    final Response<dynamic> response = await _dioService.get(
      'https://scg.dekker.lol/api/list?name=$query&page=$page&auto=true',
    );
    final SCGDataModelResponse data =
        SCGDataModelResponse.fromJson(response.data);
    allCards.addAll(data.rows);
    pageCount = data.pageCount;

    while (pageCount > page) {
      try {
        final Response<dynamic> response = await _dioService.get(
          'https://scg.dekker.lol/api/list?name=Lightning%20Bolt&page=$page&auto=true',
        );
        final SCGDataModelResponse data =
            SCGDataModelResponse.fromJson(response.data);
        allCards.addAll(data.rows);
        pageCount = data.pageCount;
        page++;
      } catch (e) {
        break;
      }
    }
    return allCards;
  }
}
