import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/utils/notifier/auction_card_size_change_notifier.dart';
import 'package:provider/provider.dart';

class AppAuctionCardSwitcher extends StatefulWidget {
  const AppAuctionCardSwitcher({super.key});

  @override
  State<AppAuctionCardSwitcher> createState() => _AppAuctionCardSwitcherState();
}

class _AppAuctionCardSwitcherState extends State<AppAuctionCardSwitcher> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Аукционы',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xff474647),
          ),
        ),
        SizedBox(height: 8),
        _SwitcherBox(
          title: 'Большие карточки',
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
    final AuctionCardSizeNotifier sizeSettings =
        context.watch<AuctionCardSizeNotifier>();
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
          value: sizeSettings.cardSize == CardSize.large,
          activeColor: const Color(0xffF45D01),
          activeTrackColor: const Color(0xff474647),
          onChanged: (bool value) {
            sizeSettings.setSize(
              value ? CardSize.large : CardSize.small,
            );
          },
        ),
      ],
    );
  }
}
