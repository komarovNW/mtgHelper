import 'package:mtg_helper/data/datasources/auctions_remote_data_source.dart';
import 'package:mtg_helper/domain/entities/auction.dart';
import 'package:mtg_helper/domain/repositories/auctions_repository.dart';

class AuctionsRepositoryImpl implements AuctionsRepository {
  AuctionsRepositoryImpl({
    required AuctionsRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final AuctionsRemoteDataSource _remoteDataSource;

  @override
  Future<List<Auction>> getAuctions() {
    return _remoteDataSource.getAuctions();
  }
}
