import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/utils/dollar_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/euro_exchange_change_notifier.dart';

extension ExchangeRates on BuildContext {
  int get dollarRate => watch<DollarExchangeChangeNotifier>().exchange;
  int get euroRate => watch<EuroExchangeChangeNotifier>().exchange;

  String priceInRublesFromDollar(String price) {
    final double parsedPrice = double.tryParse(price) ?? 0.0;
    final int result = (parsedPrice * dollarRate).floor();
    return result.toString().withRub;
  }

  String priceInRublesFromEuro(String price) {
    final double parsedPrice = double.tryParse(price) ?? 0.0;
    final int result = (parsedPrice * euroRate).floor();
    return result.toString().withRub;
  }
}

extension CurrencyFormatting on String {
  String get withDollar => '$this \$';
  String get withEuro => '$this €';
  String get withRub => '$this ₽';
}
