import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/extension/scryfall_image_extension.dart';
import 'package:mtg_helper/utils/app_navigator.dart';
import 'package:mtg_helper/widgets/app_cached_network_image.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required SearchCardModel item}) : _item = item;

  final SearchCardModel _item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.goPrice(context, _item),
      child: Column(
        children: <Widget>[
          AppCachedNetworkImage(
            url: _item.imageUrl,
            size: ImageSize.small,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              _item.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
