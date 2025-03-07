import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/domain/repositories/auctions/auctions_repository.dart';

class GetAuctionsUseCase {
  GetAuctionsUseCase({required AuctionsRepository repository})
      : _repository = repository;
  final AuctionsRepository _repository;

  Future<List<AuctionModel>> call() async {
    try {
      return await _repository.getAuctions();
    } catch (e) {
      rethrow;
    }
  }
}
