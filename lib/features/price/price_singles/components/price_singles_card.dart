import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/extension/clear_line.dart';
import 'package:mtg_helper/widgets/app_box.dart';

class SingleCard extends StatelessWidget {
  const SingleCard({super.key, required this.item});
  final SinglesCardModel item;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      item.qty.toString(),
                      style: const TextStyle(
                        color: Color(0xff474647),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Text(
                  item.line.cleanLine(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xff474647),
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          item.seller.name,
                          style: const TextStyle(
                            color: Color(0xff474647),
                            fontSize: 14,
                          ),
                        ),
                        const WBox(4),
                        item.seller.refs != ''
                            ? Container(
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
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    Text(
                      '${item.cost.toString()} ₽',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
