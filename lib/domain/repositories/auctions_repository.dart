import 'package:mtg_helper/domain/entities/auction.dart';

abstract class AuctionsRepository {
  Future<List<Auction>> getAuctions();
}
