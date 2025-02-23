import 'package:flutter/material.dart';

class PlayerCount extends StatelessWidget {
  const PlayerCount({
    super.key,
    required int score,
    required Color color,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  })  : _score = score,
        _color = color,
        _onIncrement = onIncrement,
        _onDecrement = onDecrement;

  final int _score;
  final Color _color;
  final VoidCallback _onIncrement;
  final VoidCallback _onDecrement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: _color,
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: _onDecrement,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _onIncrement,
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                '$_score',
                style: const TextStyle(
                  fontSize: 68,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
