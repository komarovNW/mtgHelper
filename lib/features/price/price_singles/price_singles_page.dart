import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/singles_card_model.dart';
import 'package:mtg_helper/extension/clear_line.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_cubit.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_state.dart';
import 'package:mtg_helper/widgets/app_box.dart';

import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class PriceSinglesPage extends StatelessWidget {
  const PriceSinglesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PriceSinglesCubit>().loadPrice();
      },
      child: BlocConsumer<PriceSinglesCubit, PriceSinglesState>(
        listener: (BuildContext context, PriceSinglesState state) {},
        builder: (BuildContext context, PriceSinglesState state) {
          return state.map(
            success: (PriceSinglesSuccess state) {
              return state.list.isEmpty
                  ? const Center(
                      child: Text('Пусто'),
                    )
                  : ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleCard(item: state.list[index]);
                      },
                    );
            },
            loading: (_) => const AppLoader(),
            failure: (PriceSinglesFailure state) =>
                AppError(error: state.error),
          );
        },
      ),
    );
  }
}

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
                    Text(
                      item.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
