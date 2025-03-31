import 'package:mtg_helper/utils/loggable_model.dart';

class PastAuctionModel extends LoggableModel {
  PastAuctionModel({
    required this.id,
    required this.lot,
    required this.dateEnded,
    required this.winner,
    required this.seller,
    required this.winningBid,
  });

  factory PastAuctionModel.fromJson(Map<String, dynamic> json) {
    try {
      return PastAuctionModel(
        id: json['id']?.toString() ?? '',
        lot: json['lot']?.toString() ?? '',
        dateEnded: _parseDate(json['date_ended']),
        winner: json['winner'] != null
            ? Winner.fromJson(json['winner'])
            : Winner.empty(),
        seller: json['seller'] != null
            ? Seller.fromJson(json['seller'])
            : Seller.empty(),
        winningBid: json['winning_bid']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('PastAuctionModel', json, e, stackTrace);
      return PastAuctionModel.empty();
    }
  }

  factory PastAuctionModel.empty() {
    return PastAuctionModel(
      id: '',
      lot: '',
      dateEnded: DateTime.fromMillisecondsSinceEpoch(0),
      winner: Winner.empty(),
      seller: Seller.empty(),
      winningBid: '',
    );
  }

  final String id;
  final String lot;
  final DateTime dateEnded;
  final Winner winner;
  final Seller seller;
  final String winningBid;

  static DateTime _parseDate(dynamic timestamp) {
    if (timestamp == null) return DateTime.fromMillisecondsSinceEpoch(0);
    final int? millis = int.tryParse(timestamp.toString());
    if (millis == null) return DateTime.fromMillisecondsSinceEpoch(0);
    return DateTime.fromMillisecondsSinceEpoch(millis * 1000);
  }
}

class Winner extends LoggableModel {
  Winner({
    required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });

  factory Winner.fromJson(Map<String, dynamic> json) {
    try {
      return Winner(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        city: json['city']?.toString() ?? '',
        refs: json['refs']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('Winner', json, e, stackTrace);
      return Winner.empty();
    }
  }

  factory Winner.empty() {
    return Winner(id: '', name: '', city: '', refs: '');
  }

  final String id;
  final String name;
  final String city;
  final String refs;
}

class Seller extends LoggableModel {
  Seller({
    required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    try {
      return Seller(
        id: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        city: json['city']?.toString() ?? '',
        refs: json['refs']?.toString() ?? '',
      );
    } catch (e, stackTrace) {
      LoggableModel.logError('Seller', json, e, stackTrace);
      return Seller.empty();
    }
  }

  factory Seller.empty() {
    return Seller(id: '', name: '', city: '', refs: '');
  }

  final String id;
  final String name;
  final String city;
  final String refs;
}

class PastAuctionDataModelResponse {
  PastAuctionDataModelResponse({
    required this.auctions,
  });

  factory PastAuctionDataModelResponse.fromJson(Map<String, dynamic> json) {
    try {
      return PastAuctionDataModelResponse(
        auctions: List<PastAuctionModel>.from(
          (json['auctions'] as List<dynamic>? ?? <PastAuctionModel>[]).map(
            (dynamic x) => PastAuctionModel.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );
    } catch (e, stackTrace) {
      LoggableModel.logError(
        'PastAuctionDataModelResponse',
        json,
        e,
        stackTrace,
      );
      return PastAuctionDataModelResponse(auctions: <PastAuctionModel>[]);
    }
  }

  final List<PastAuctionModel> auctions;
}
