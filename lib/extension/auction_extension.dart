import 'package:intl/intl.dart';
import 'package:mtg_helper/domain/entities/auction.dart';

extension AuctionFormatting on Auction {
  String get formattedDateEstimated {
    return DateFormat('dd.MM HH:mm').format(dateEstimated);
  }

  String get formattedCurrentBid {
    return currentBid == 0 ? 'Ставок нет' : currentBid.toStringAsFixed(0);
  }
}
