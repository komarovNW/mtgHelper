import 'package:mtg_helper/data/datasources/price/scg_remote_data_source.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';
import 'package:mtg_helper/domain/repositories/price/price_scg_repository.dart';

class PriceSCGRepositoryImpl implements PriceSCGRepository {
  PriceSCGRepositoryImpl({
    required SCGRemoteDataSource scgRemoteDataSource,
  }) : _scgRemoteDataSource = scgRemoteDataSource;

  final SCGRemoteDataSource _scgRemoteDataSource;

  @override
  Future<List<SCGCardModel>> getSCGPrice(String query) {
    return _scgRemoteDataSource.getSCG(query);
  }
}
