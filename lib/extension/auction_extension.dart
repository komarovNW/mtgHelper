import 'package:intl/intl.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';

extension AuctionFormatting on AuctionModel {
  String get formattedDateEstimated {
    return DateFormat('dd.MM HH:mm').format(dateEstimated);
  }

  String get formattedCurrentBid {
    return currentBid == 0 ? 'Ставок нет' : currentBid.toStringAsFixed(0);
  }
}

extension PastAuctionFormatting on PastAuctionModel {
  String get formattedDateEstimated {
    return DateFormat('dd.MM.yyyy').format(dateEnded);
  }

  String get formattedCurrentBid {
    return winningBid == '0' ? 'Ставок не было' : '$winningBid ₽';
  }
}
