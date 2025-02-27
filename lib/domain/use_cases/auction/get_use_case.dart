import 'package:mtg_helper/domain/entities/auction.dart';
import 'package:mtg_helper/domain/repositories/auction/auctions_repository.dart';

class GetUseCase {
  GetUseCase({required AuctionsRepository repository})
      : _repository = repository;
  final AuctionsRepository _repository;

  Future<List<Auction>> call() async {
    return await _repository.getAuctions();
  }
}
