// import 'package:mtg_helper/data/datasources/price/auction_remote_data_source.dart';
// import 'package:mtg_helper/data/datasources/price/scg_remote_data_source.dart';
// import 'package:mtg_helper/data/datasources/price/singles_remote_data_source.dart';
// import 'package:mtg_helper/data/datasources/price/tcg_remote_data_source.dart';
// import 'package:mtg_helper/data/models/scryfall_card_model.dart';
//
// import 'package:mtg_helper/domain/repositories/price_repository.dart';
//
// class PriceRepositoryImpl implements PriceRepository {
//   PriceRepositoryImpl({
//     required AuctionRemoteDataSource auctionRemoteDataSource,
//     required SCGRemoteDataSource scgRemoteDataSource,
//     required SinglesRemoteDataSource singlesRemoteDataSource,
//     required TCGRemoteDataSource tcgRemoteDataSource,
//   })  : _auctionRemoteDataSource = auctionRemoteDataSource,
//         _scgRemoteDataSource = scgRemoteDataSource,
//         _singlesRemoteDataSource = singlesRemoteDataSource,
//         _tcgRemoteDataSource = tcgRemoteDataSource;
//
//   final AuctionRemoteDataSource _auctionRemoteDataSource;
//   final SCGRemoteDataSource _scgRemoteDataSource;
//   final SinglesRemoteDataSource _singlesRemoteDataSource;
//   final TCGRemoteDataSource _tcgRemoteDataSource;
//
//   @override
//   Future<List<dynamic>> getSCGPrice(String query) {
//     return _scgRemoteDataSource.getSCG(query);
//   }
//
//   @override
//   Future<List<ScryfallCardModel>> getTCGPrice(String query) {
//     return _tcgRemoteDataSource.getTCG(query);
//   }
//
//   @override
//   Future<List<dynamic>> getSinglesPrice(String query) {
//     return _singlesRemoteDataSource.getSingles(query);
//   }
//
//   @override
//   Future<List<dynamic>> getAuctionPrice(String query) {
//     return _auctionRemoteDataSource.getAuctions(query);
//   }
// }
