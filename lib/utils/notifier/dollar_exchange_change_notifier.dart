import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DollarExchangeChangeNotifier extends ChangeNotifier {
  int _exchange = 90;
  bool _useCustomExchange = false;

  int get exchange => _exchange;
  bool get useCustomExchange => _useCustomExchange;

  Future<int> getDollarExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('custom_dollar_exchange') ?? 90;
  }

  Future<bool> getUseCustomExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('use_custom_dollar_exchange') ?? false;
  }

  Future<void> setDollarExchange(int exchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('custom_dollar_exchange', exchange);
    _exchange = exchange;
    notifyListeners();
  }

  Future<void> setUseCustomRate(bool useCustomExchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('use_custom_dollar_exchange', useCustomExchange);
    _useCustomExchange = useCustomExchange;
    notifyListeners();
  }

  Future<void> loadDollarExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _exchange = prefs.getInt('custom_dollar_exchange') ?? 90;
    _useCustomExchange = prefs.getBool('use_custom_dollar_exchange') ?? false;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getCurrentExchangeData() async {
    await loadDollarExchange();
    return <String, dynamic>{
      'exchange': _exchange,
      'useCustomExchange': _useCustomExchange,
    };
  }
}
