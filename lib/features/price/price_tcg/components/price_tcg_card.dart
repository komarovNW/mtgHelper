import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scryfall_card_model.dart';
import 'package:mtg_helper/extension/exchange_extension.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/notifier/dollar_exchange_change_notifier.dart';
import 'package:mtg_helper/utils/notifier/euro_exchange_change_notifier.dart';

import 'package:mtg_helper/widgets/app_cached_network_image.dart';

class PriceTCGCard extends StatelessWidget {
  const PriceTCGCard({super.key, required this.item});
  final ScryfallCardModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            AppCachedNetworkImage(
              url: item.imageUris.normal,
              size: ImageSize.large,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item.setName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474647),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _TCGColumn(item: item),
                  _CardMarketColumn(item: item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardMarketColumn extends StatelessWidget {
  const _CardMarketColumn({required this.item});
  final ScryfallCardModel item;

  @override
  Widget build(BuildContext context) {
    final bool useExchange =
        context.watch<EuroExchangeChangeNotifier>().useCustomExchange;

    return Column(
      children: <Widget>[
        Text(
          context.l10n.priceTCGCardMarket,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff474647),
          ),
        ),
        if (item.prices.eur != '')
          Row(
            children: <Widget>[
              Text(
                context.l10n.priceTCGRegular,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474647),
                ),
              ),
              Text(' - ${item.prices.eur.withEuro}'),
              if (useExchange)
                Text(' / ${context.priceInRublesFromEuro(item.prices.eur)}'),
            ],
          ),
        if (item.prices.eurFoil != '')
          Row(
            children: <Widget>[
              Text(
                context.l10n.priceTCGFoil,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474647),
                ),
              ),

              ///TODO придумать что делать когда не вмещается
              Text(' - ${item.prices.eurFoil.withEuro}'),
              if (useExchange)
                Text(
                  ' / ${context.priceInRublesFromEuro(item.prices.eurFoil)}',
                ),
            ],
          ),
      ],
    );
  }
}

class _TCGColumn extends StatelessWidget {
  const _TCGColumn({required this.item});
  final ScryfallCardModel item;

  @override
  Widget build(BuildContext context) {
    final bool useExchange =
        context.watch<DollarExchangeChangeNotifier>().useCustomExchange;
    return Column(
      children: <Widget>[
        Text(
          context.l10n.priceTCGTCG,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff474647),
          ),
        ),
        if (item.prices.usd != '')
          Row(
            children: <Widget>[
              Text(
                context.l10n.priceTCGRegular,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474647),
                ),
              ),
              Text(' - ${item.prices.usd.withDollar}'),
              if (useExchange)
                Text(' / ${context.priceInRublesFromDollar(item.prices.usd)}'),
            ],
          ),
        if (item.prices.usdFoil != '')
          Row(
            children: <Widget>[
              Text(
                context.l10n.priceTCGFoil,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474647),
                ),
              ),
              Text(' - ${item.prices.usdFoil.withDollar}'),
              if (useExchange)
                Text(
                  ' / ${context.priceInRublesFromDollar(item.prices.usdFoil)}',
                ),
            ],
          ),
        if (item.prices.usdEtched != '')
          Row(
            children: <Widget>[
              Text(
                context.l10n.priceTCGEtched,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474647),
                ),
              ),
              Text(' - ${item.prices.usdEtched.withDollar}'),
              if (useExchange)
                Text(
                  ' / ${context.priceInRublesFromDollar(item.prices.usdEtched)}',
                ),
            ],
          ),
      ],
    );
  }
}
