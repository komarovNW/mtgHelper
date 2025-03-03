import 'package:flutter/material.dart';

class PastAuctionDataModelResponse {
  PastAuctionDataModelResponse({
    // required this.totalPages,
    // required this.currentPage,
    required this.auctions,
  });

  factory PastAuctionDataModelResponse.fromJson(Map<String, dynamic> json) {
    try {
      return PastAuctionDataModelResponse(
        // totalPages: json['total_pages'],
        // currentPage: json['current_page'],
        auctions: List<PastAuctionModel>.from(
          json['auctions'].map((dynamic x) => PastAuctionModel.fromJson(x)),
        ),
      );
    } catch (e) {
      debugPrint('Ошибка при парсинге PastAuctionDataModelResponse: $e');
      debugPrint('Ошибка на ключах: ${json.keys}');
      rethrow;
    }
  }

  // final int totalPages;
  // final int currentPage;
  final List<PastAuctionModel> auctions;
}

class PastAuctionModel {
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
        id: json['id'].toString(),
        lot: json['lot'].toString(),
        dateEnded: DateTime.fromMillisecondsSinceEpoch(
          int.parse(json['date_ended'].toString()) * 1000,
        ),
        winner: json['winner'] != null
            ? Winner.fromJson(json['winner'])
            : Winner(id: '', name: '', city: '', refs: ''),
        seller: Seller.fromJson(json['seller']),
        winningBid: json['winning_bid'].toString(),
      );
    } catch (e) {
      debugPrint('Ошибка при парсинге PastAuctionModel: $e');
      debugPrint('Объект: $json');
      debugPrint('Ошибка на ключах: ${json.keys}');
      rethrow;
    }
  }

  final String id;
  final String lot;
  final DateTime dateEnded;
  final Winner winner;
  final Seller seller;
  final String winningBid;
}

class Winner {
  Winner({
    required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });

  factory Winner.fromJson(Map<String, dynamic> json) {
    try {
      return Winner(
        id: json['id'].toString(),
        name: json['name'].toString(),
        city: json['city'].toString(),
        refs: json['refs'].toString(),
      );
    } catch (e) {
      debugPrint('Ошибка при парсинге Winner: $e');
      debugPrint('Ошибка на ключах: ${json.keys}');
      rethrow;
    }
  }

  final String id;
  final String name;
  final String city;
  final String refs;
}

class Seller {
  Seller({
    required this.id,
    required this.name,
    required this.city,
    required this.refs,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    try {
      return Seller(
        id: json['id'].toString(),
        name: json['name'].toString(),
        city: json['city'].toString(),
        refs: json['refs'].toString(),
      );
    } catch (e) {
      debugPrint('Ошибка при парсинге Seller: $e');
      debugPrint('Ошибка на ключах: ${json.keys}');
      rethrow;
    }
  }

  final String id;
  final String name;
  final String city;
  final String refs;
}
