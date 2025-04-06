import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/utils/notifier/player_count_notifier.dart';
import 'package:provider/provider.dart';

class AppPlayerCountSwitcher extends StatefulWidget {
  const AppPlayerCountSwitcher({super.key});

  @override
  State<AppPlayerCountSwitcher> createState() => _AppPlayerCountSwitcherState();
}

class _AppPlayerCountSwitcherState extends State<AppPlayerCountSwitcher> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Счет',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xff474647),
          ),
        ),
        SizedBox(height: 8),
        _SwitcherBox(
          title: 'На двоих',
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _SwitcherBox extends StatelessWidget {
  const _SwitcherBox({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final PlayerCountNotifier playerCount =
        context.watch<PlayerCountNotifier>();
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const Spacer(),
        Switch(
          value: playerCount.playerCount == PlayerCount.two,
          activeColor: const Color(0xffF45D01),
          activeTrackColor: const Color(0xff474647),
          onChanged: (bool value) {
            playerCount.setCount(
              value ? PlayerCount.two : PlayerCount.four,
            );
          },
        ),
      ],
    );
  }
}
