import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EuroExchangeChangeNotifier extends ChangeNotifier {
  int _exchange = 100;
  bool _useCustomExchange = false;

  int get exchange => _exchange;
  bool get useCustomExchange => _useCustomExchange;

  Future<int> getEuroExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('custom_euro_exchange') ?? 100;
  }

  Future<bool> getUseCustomExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('use_custom_euro_exchange') ?? false;
  }

  Future<void> setEuroExchange(int exchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('custom_euro_exchange', exchange);
    _exchange = exchange;
    notifyListeners();
  }

  Future<void> setUseCustomRate(bool useCustomExchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('use_custom_euro_exchange', useCustomExchange);
    _useCustomExchange = useCustomExchange;
    notifyListeners();
  }

  Future<void> loadEuroExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _exchange = prefs.getInt('custom_euro_exchange') ?? 100;
    _useCustomExchange = prefs.getBool('use_custom_euro_exchange') ?? false;
    notifyListeners();
  }
}
