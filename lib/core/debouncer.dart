import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({required this.delay});
  final Duration delay;
  Timer? _timer;

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void cancel() {
    _timer?.cancel();
  }

  bool get isActive => _timer?.isActive ?? false;
}
