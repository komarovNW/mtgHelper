import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  const Reset({
    super.key,
    required VoidCallback reset,
  }) : _reset = reset;

  final VoidCallback _reset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _reset,
      child: Center(
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.refresh,
            size: 50,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
