import 'package:flutter/material.dart';

import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/extension/auction_extension.dart';
import 'package:mtg_helper/widgets/app_cached_network_image.dart';

import 'package:url_launcher/url_launcher.dart';

class AuctionCard extends StatelessWidget {
  const AuctionCard({
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
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppCachedNetworkImage(
            url: item.imageUrl,
            size: ImageSize.large,
            needFavoriteIcon: needFavoriteIcon,
            isFavoriteIcon: isFavoriteIcon,
            onPressedFavoriteIcon: onPressedFavoriteIcon,
          ),
          const HBox(8),
          AuctionCardDescription(
            lot: item.lot,
            sellerName: item.seller.name,
            sellerRefs: item.seller.refs,
            currentBid: item.formattedCurrentBid,
            bidAmount: item.bidAmount.toString(),
            dateEstimated: item.formattedDateEstimated,
          ),
          const HBox(8),
          AuctionCardButton(
            item: item,
          ),
        ],
      ),
    );
  }
}

class AuctionCardDescription extends StatelessWidget {
  const AuctionCardDescription({
    super.key,
    required String lot,
    required String sellerName,
    required String sellerRefs,
    required String currentBid,
    required String bidAmount,
    required String dateEstimated,
  })  : _lot = lot,
        _sellerName = sellerName,
        _sellerRefs = sellerRefs,
        _currentBid = currentBid,
        _bidAmount = bidAmount,
        _dateEstimated = dateEstimated;

  final String _lot;
  final String _sellerName;
  final String _sellerRefs;
  final String _currentBid;
  final String _bidAmount;
  final String _dateEstimated;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <AuctionTextItem>[
        AuctionTextItem(
          title: context.l10n.auctionCardDescriptionLot,
          text: _lot,
        ),
        AuctionTextItem(
          title: context.l10n.auctionCardDescriptionSeller,
          text: _sellerName,
          additionalCount: _sellerRefs,
        ),
        AuctionTextItem(
          title: context.l10n.auctionCardDescriptionCurrentBid,
          text: '$_currentBid ₽',
        ),
        AuctionTextItem(
          title: context.l10n.auctionCardDescriptionBidAmount,
          text: _bidAmount,
        ),
        AuctionTextItem(
          title: context.l10n.auctionCardDescriptionDateEstimated,
          text: _dateEstimated,
        ),
      ],
    );
  }
}

class AuctionCardButton extends StatelessWidget {
  const AuctionCardButton({super.key, required this.item});
  final AuctionModel item;

  void _launchURL() async {
    final Uri url =
        Uri.parse('https://topdeck.ru/apps/toptrade/auctions/${item.id}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Не удалось открыть ссылку $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            context.l10n.auctionCardButtonText,
            style: const TextStyle(
              color: Color(0xff2D7DD2),
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class AuctionTextItem extends StatelessWidget {
  const AuctionTextItem({
    super.key,
    required this.title,
    required this.text,
    this.additionalCount,
  });
  final String title;
  final String text;
  final String? additionalCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                      color: Color(0xff474647),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: text,
                  ),
                  if (additionalCount != null)
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
                          additionalCount!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
    );
  }
}
