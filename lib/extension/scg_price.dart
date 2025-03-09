import 'package:mtg_helper/data/models/scg_card_model.dart';

extension SCGCardPriceExtension on ScgCardAttributes {
  String getFormattedPrice() {
    if (price.isEmpty) return 'No price available';

    final double? parsedPrice = double.tryParse(price);
    final bool checkIsOnSale = isOnSale == 'Yes';
    final double? salePrice = double.tryParse(priceSale);

    final StringBuffer priceText = StringBuffer();

    priceText.write('\$${parsedPrice?.toStringAsFixed(2)}');

    if (quantity == 0) {
      priceText.write(' (Out of stock)');
    }

    if (checkIsOnSale && salePrice != null) {
      priceText.write('\n\$${salePrice.toStringAsFixed(2)} (Sale price)');
    }

    return priceText.toString();
  }
}
