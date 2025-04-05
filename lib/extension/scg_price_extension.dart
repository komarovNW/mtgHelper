import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';
import 'package:mtg_helper/extension/exchange_extension.dart';

extension SCGCardPriceExtension on ScgCardAttributes {
  String getFormattedPrice(BuildContext context, bool useCustomExchange) {
    if (price.isEmpty) return 'No price available';

    final double? parsedPrice = double.tryParse(price);
    final bool checkIsOnSale = isOnSale == 'Yes';
    final double? salePrice = double.tryParse(priceSale);

    final StringBuffer priceText = StringBuffer();

    // Получаем курс доллара из context
    final int dollarRate = context.dollarRate;

    // Если включен useCustomExchange, конвертируем в рубли
    final String priceInRubles = (useCustomExchange && parsedPrice != null)
        ? ' / ${(parsedPrice * dollarRate).toStringAsFixed(0)}₽'
        : '';

    priceText.write('\$${parsedPrice?.toStringAsFixed(2)}$priceInRubles');

    if (quantity == 0) {
      priceText.write(' (Out of stock)');
    }

    if (checkIsOnSale && salePrice != null) {
      final String salePriceInRubles = (useCustomExchange)
          ? ' / ${(salePrice * dollarRate).toStringAsFixed(0)}₽'
          : '';
      priceText.write(
        '\n\$${salePrice.toStringAsFixed(2)}$salePriceInRubles (Sale price)',
      );
    }

    return priceText.toString();
  }
}
