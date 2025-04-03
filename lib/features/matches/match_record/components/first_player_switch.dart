import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

class PlayFirstSwitch extends StatelessWidget {
  const PlayFirstSwitch({
    super.key,
    required this.isOnPlay,
    required this.onChanged,
  });
  final bool isOnPlay;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            context.l10n.matchesOnPlay,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            activeColor: const Color(0xffF45D01),
            activeTrackColor: const Color(0xff474647),
            value: isOnPlay,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
