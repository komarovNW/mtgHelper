import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EuroExchangeNotifier extends ChangeNotifier {
  int _exchange = 100; // Курс по умолчанию
  bool _useCustomExchange = false; // Флаг использования кастомного курса

  int get exchange => _exchange;
  bool get useCustomExchange => _useCustomExchange;

  // Получаем текущий курс евро из SharedPreferences
  Future<int> getEuroExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('custom_euro_exchange') ?? 100;
  }

  // Получаем флаг использования кастомного курса
  Future<bool> getUseCustomExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('use_custom_euro_exchange') ?? false;
  }

  // Устанавливаем новый курс евро и сохраняем его в SharedPreferences
  Future<void> setEuroExchange(int exchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('custom_euro_exchange', exchange);
    _exchange = exchange;
    notifyListeners();
  }

  // Включаем/выключаем кастомный курс и сохраняем его состояние в SharedPreferences
  Future<void> setUseCustomRate(bool useCustomExchange) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('use_custom_euro_exchange', useCustomExchange);
    _useCustomExchange = useCustomExchange;
    notifyListeners();
  }

  // Метод для загрузки курса евро и флага использования кастомного курса из SharedPreferences
  Future<void> loadEuroExchange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _exchange = prefs.getInt('custom_euro_exchange') ?? 100;
    _useCustomExchange = prefs.getBool('use_custom_euro_exchange') ?? false;
    notifyListeners();
  }
}
