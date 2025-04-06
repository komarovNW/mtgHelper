import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuctionCardSizeNotifier extends ChangeNotifier {
  AuctionCardSizeNotifier() {
    _load();
  }
  static const String _key = 'card_size';
  CardSize _cardSize = CardSize.large;

  CardSize get cardSize => _cardSize;

  Future<void> _load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedSize = prefs.getString(_key);
    if (savedSize != null) {
      _cardSize = CardSizeExtension.fromKey(savedSize);
      notifyListeners();
    }
  }

  Future<void> toggle() async {
    _cardSize = _cardSize == CardSize.large ? CardSize.small : CardSize.large;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _cardSize.key);
    notifyListeners();
  }

  Future<void> setSize(CardSize size) async {
    _cardSize = size;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, size.key);
    notifyListeners();
  }
}

enum CardSize {
  small,
  large,
}

extension CardSizeExtension on CardSize {
  String get key => toString().split('.').last;

  static CardSize fromKey(String key) {
    return CardSize.values.firstWhere(
      (CardSize e) => e.key == key,
      orElse: () => CardSize.large,
    );
  }
}
