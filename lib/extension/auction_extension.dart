import 'package:intl/intl.dart';
import 'package:mtg_helper/data/models/auction_model.dart';

extension AuctionFormatting on AuctionModel {
  String get formattedDateEstimated {
    return DateFormat('dd.MM HH:mm').format(dateEstimated);
  }

  String get formattedCurrentBid {
    return currentBid == 0 ? 'Ставок нет' : currentBid.toStringAsFixed(0);
  }
}
