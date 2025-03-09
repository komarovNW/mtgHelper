import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DollarExchangeNotifier extends ChangeNotifier {
  int _exchange = 90; // Курс по умолчанию
  bool _useCustomExchange = false; // Флаг использования кастомного курса

  int get exchange => _exchange;
  bool get useCustomExchange => _useCustomExchange;

  // Получаем текущий курс доллара из SharedPreferences
  Future<int> getDollarExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('custom_dollar_exchange') ?? 90;
  }

  // Получаем флаг использования кастомного курса
  Future<bool> getUseCustomExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('use_custom_dollar_exchange') ?? false;
  }

  // Устанавливаем новый курс доллара и сохраняем его в SharedPreferences
  Future<void> setDollarExchange(int exchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('custom_dollar_exchange', exchange);
    _exchange = exchange;
    notifyListeners();
  }

  // Включаем/выключаем кастомный курс и сохраняем его состояние в SharedPreferences
  Future<void> setUseCustomRate(bool useCustomExchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('use_custom_dollar_exchange', useCustomExchange);
    _useCustomExchange = useCustomExchange;
    notifyListeners();
  }

  // Метод для загрузки курса доллара и флага использования кастомного курса из SharedPreferences
  Future<void> loadDollarExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _exchange = prefs.getInt('custom_dollar_exchange') ?? 90;
    _useCustomExchange = prefs.getBool('use_custom_dollar_exchange') ?? false;
    notifyListeners();
  }

  // Метод для получения всех текущих данных
  Future<Map<String, dynamic>> getCurrentExchangeData() async {
    await loadDollarExchange(); // Загружаем данные при запросе
    return <String, dynamic>{
      'exchange': _exchange,
      'useCustomExchange': _useCustomExchange,
    };
  }
}
