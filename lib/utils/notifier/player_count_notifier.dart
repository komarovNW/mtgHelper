import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerCountNotifier extends ChangeNotifier {
  PlayerCountNotifier() {
    _load();
  }

  static const String _key = 'player_count';
  PlayerCount _playerCount = PlayerCount.two;

  PlayerCount get playerCount => _playerCount;

  Future<void> _load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedCount = prefs.getString(_key);
    if (savedCount != null) {
      _playerCount = PlayerCountExtension.fromKey(savedCount);
      notifyListeners();
    }
  }

  Future<void> toggle() async {
    _playerCount =
        _playerCount == PlayerCount.two ? PlayerCount.four : PlayerCount.two;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _playerCount.key);
    notifyListeners();
  }

  Future<void> setCount(PlayerCount count) async {
    _playerCount = count;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, count.key);
    notifyListeners();
  }
}

enum PlayerCount {
  two(health: 20),
  four(health: 40);

  const PlayerCount({required this.health});

  final int health;
}

extension PlayerCountExtension on PlayerCount {
  String get key => toString().split('.').last;

  static PlayerCount fromKey(String key) {
    return PlayerCount.values.firstWhere(
      (PlayerCount e) => e.key == key,
      orElse: () => PlayerCount.two,
    );
  }

  int get value => this == PlayerCount.two ? 2 : 4;
}
