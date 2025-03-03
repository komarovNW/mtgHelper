import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';
import 'package:mtg_helper/extension/foil_check_extension.dart';
import 'package:mtg_helper/widgets/app_box.dart';

class PastAuctionCard extends StatelessWidget {
  const PastAuctionCard({super.key, required this.item});
  final PastAuctionModel item;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        item.lot,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    item.lot.containsFoil()
                        ? Image.asset('assets/png/foil.png')
                        : const SizedBox.shrink(),
                  ],
                ),
                const HBox(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${item.winningBid} ₽',
                      style: const TextStyle(
                        color: Color(0xff474647),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      DateFormat('dd.MM.yyyy').format(item.dateEnded),
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
