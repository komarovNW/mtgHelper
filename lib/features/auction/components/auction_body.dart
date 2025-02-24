import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class AuctionBody extends StatelessWidget {
  const AuctionBody({
    super.key,
    required List<Map<String, dynamic>> list,
    required ScrollController scrollController,
    required bool hasMore,
  })  : _list = list,
        _scrollController = scrollController,
        _hasMore = hasMore;

  final List<Map<String, dynamic>> _list;
  final ScrollController _scrollController;
  final bool _hasMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _hasMore ? _list.length + 1 : _list.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == _list.length && _hasMore) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return AuctionCard(
              item: _list[index],
            );
          }
        },
      ),
    );
  }
}

class AuctionCard extends StatelessWidget {
  const AuctionCard({super.key, required this.item});
  final Map<String, dynamic> item;

  _checkData(String timestampString) {
    final int timestamp = int.parse(timestampString);
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AuctionCardImage(
            imgUrl: item['image_url'],
          ),
          const HBox(8),
          AuctionCardDescription(
            lot: item['lot'].toString(),
            sellerName: item['seller']['name'].toString(),
            sellerRefs: item['seller']['refs'].toString(),
            currentBid: item['current_bid'].toString(),
            bidAmount: item['bid_amount'].toString(),
            dateEstimated: _checkData(item['date_estimated']),
          ),
          const HBox(8),
          const AuctionCardButton(),
        ],
      ),
    );
  }
}

class AuctionCardImage extends StatelessWidget {
  const AuctionCardImage({
    super.key,
    required String imgUrl,
  }) : _imgUrl = imgUrl;
  final String _imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: CachedNetworkImage(
        imageUrl: _imgUrl,
        fadeInDuration: const Duration(milliseconds: 300),
        fadeOutDuration: const Duration(milliseconds: 100),
        placeholder: (BuildContext context, String url) => Container(
          width: double.infinity,
          height: 500.0,
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
          text: '$_currentBid руб',
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
  const AuctionCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => debugPrint('переход на topdeck'),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Перейти на TopDeck',
            style: TextStyle(
              color: Colors.blue,
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
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
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
                          color: Colors.blue,
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
