import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/models/all_auctions_model.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/data/models/past_auctions_model.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/price/price_auction/components/current_auction_card.dart';
import 'package:mtg_helper/features/price/price_auction/components/past_auction_card.dart';
import 'package:mtg_helper/features/price/price_auction/price_auction_cubit.dart';
import 'package:mtg_helper/features/price/price_auction/price_auction_state.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

class PriceAuctionPage extends StatelessWidget {
  const PriceAuctionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceAuctionCubit, PriceAuctionState>(
      listener: (BuildContext context, PriceAuctionState state) {},
      builder: (BuildContext context, PriceAuctionState state) {
        return state.map(
          success: (PriceAuctionSuccess state) => _Body(item: state.item),
          loading: (_) => const AppLoader(),
          failure: (_) => const AppError(
            error: 'ошибка',
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.item});
  final AllAuctionsModel item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AuctionSection<AuctionModel>(
            title: context.l10n.priceAuctionCurrentTitle,
            auctions: item.currentAuctions,
            buildCard: (AuctionModel auction) =>
                CurrentAuctionCard(item: auction),
          ),
          AuctionSection<PastAuctionModel>(
            title: context.l10n.priceAuctionPastTitle,
            auctions: item.pastAuctions,
            buildCard: (PastAuctionModel auction) =>
                PastAuctionCard(item: auction),
          ),
        ],
      ),
    );
  }
}

class AuctionSection<T> extends StatelessWidget {
  const AuctionSection({
    super.key,
    required this.title,
    required this.auctions,
    required this.buildCard,
  });
  final String title;
  final List<T> auctions;
  final Widget Function(T) buildCard;

  @override
  Widget build(BuildContext context) {
    if (auctions.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HBox(12),
        PriceAuctionTitle(title: title),
        const HBox(8),
        ...auctions.map(buildCard),
      ],
    );
  }
}

class PriceAuctionTitle extends StatelessWidget {
  const PriceAuctionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
