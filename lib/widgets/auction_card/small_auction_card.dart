import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/extension/auction_extension.dart';
import 'package:mtg_helper/extension/exchange_extension.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/open_topdeck_auc.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_cached_network_image.dart';
import 'package:mtg_helper/widgets/app_favorite_icon_button.dart';

class SmallAuctionCard extends StatelessWidget {
  const SmallAuctionCard({
    super.key,
    required this.item,
    this.needFavoriteIcon = false,
    this.isFavoriteIcon = false,
    required this.onPressedFavoriteIcon,
  });
  final AuctionModel item;
  final bool needFavoriteIcon;
  final bool isFavoriteIcon;
  final VoidCallback onPressedFavoriteIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          AppCachedNetworkImage(
            url: item.imageUrl,
            size: ImageSize.medium,
            canOpenFullScreen: true,
          ),
          const WBox(8),
          Expanded(
            child: InkWell(
              onTap: () => showConfirmAuctionDialog(
                context: context,
                itemId: item.id,
              ),
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
                        '${context.l10n.auctionCardDescriptionCurrentBidMin} ${item.currentBid.toString().withRub}',
                        style: const TextStyle(
                          color: Color(0xff474647),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const HBox(8),
                  Text(
                    '${context.l10n.auctionCardDescriptionDateEstimated} ${item.formattedDateEstimated}',
                    style: const TextStyle(
                      color: Color(0xff474647),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const HBox(8),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                text: item.seller.name,
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff2D7DD2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    item.seller.refs,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AppFavoriteIconButton(
            isFavorite: isFavoriteIcon,
            onPressed: onPressedFavoriteIcon,
          ),
        ],
      ),
    );
  }
}
