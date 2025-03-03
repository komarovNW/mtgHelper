import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/extension/auction_extension.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_cached_network_image.dart';

class CurrentAuctionCard extends StatelessWidget {
  const CurrentAuctionCard({super.key, required this.item});
  final AuctionModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xffF6F6F6),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          AppCachedNetworkImage(url: item.imageUrl, size: ImageSize.medium),
          const WBox(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  item.lot,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const HBox(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Mакс: ${item.currentBid.toString()} ₽',
                      style: const TextStyle(
                        color: Color(0xff474647),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      item.formattedDateEstimated,
                      style: const TextStyle(
                        color: Color(0xff474647),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
