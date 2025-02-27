import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/extension/search_card.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({super.key, required this.item});
  final SearchCardModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          child: CachedNetworkImage(
            imageUrl: item.imageUrl,
            placeholder: (BuildContext context, String url) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.grey[300]!, Colors.grey[200]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ),
            errorWidget: (BuildContext context, String url, Object error) =>
                const Icon(Icons.error),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
