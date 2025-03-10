import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/scg_card_model.dart';
import 'package:mtg_helper/extension/scg_price.dart';
import 'package:mtg_helper/utils/dollar_exchange_notifier.dart';
import 'package:mtg_helper/widgets/app_cached_network_image.dart';

class SCGCard extends StatelessWidget {
  const SCGCard({super.key, required this.item});
  final ScgCardModel item;

  @override
  Widget build(BuildContext context) {
    final bool useExchange =
        context.watch<DollarExchangeNotifier>().useCustomExchange;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            AppCachedNetworkImage(
              url: item.imageUrl ?? '',
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
              child: Text(
                item.attributes.isNotEmpty
                    ? item.attributes.first
                        .getFormattedPrice(context, useExchange)
                    : 'No price available',
                style: const TextStyle(color: Color(0xff474647)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
