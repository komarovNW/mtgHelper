import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/extension/scryfall_image_extension.dart';
import 'package:mtg_helper/features/price/price_router.dart';
import 'package:mtg_helper/features/search/search_router.dart';
import 'package:mtg_helper/widgets/app_cached_network_image.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required SearchCardModel item}) : _item = item;

  final SearchCardModel _item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(
        '${SearchRoutes.searchPath}/${PriceRoutes.pricePath}',
        extra: _item,
      ),
      // AppNavigator.goPrice(context, _item),
      child: Column(
        children: <Widget>[
          AppCachedNetworkImage(
            url: _item.imageUrl,
            size: ImageSize.small,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                _item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
