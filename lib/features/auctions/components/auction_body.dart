import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/auction_model.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/auctions/auctions_cubit.dart';
import 'package:mtg_helper/features/auctions/components/auctions_card.dart';
import 'package:provider/provider.dart';

class AuctionsBody extends StatelessWidget {
  const AuctionsBody({
    super.key,
    required this.favoriteAuctions,
    required this.allAuctions,
    required this.favoritesIds,
    required this.isFavorites,
  });
  final bool isFavorites;
  final List<AuctionModel> favoriteAuctions;
  final List<AuctionModel> allAuctions;
  final Set<String> favoritesIds;

  @override
  Widget build(BuildContext context) {
    final List<AuctionModel> auctions =
        isFavorites ? favoriteAuctions : allAuctions;
    if (auctions.isEmpty) {
      return Center(
        child: Text(
          isFavorites
              ? context.l10n.auctionEmptyFavoritesList
              : context.l10n.auctionEmptyList,
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: auctions.length,
      itemBuilder: (_, int index) {
        final AuctionModel auction = auctions[index];
        return AuctionCard(
          isFavoriteIcon: favoritesIds.contains(auction.id),
          needFavoriteIcon: true,
          item: auction,
          onPressedFavoriteIcon: () =>
              context.read<AuctionsCubit>().toggleFavorite(auction.id),
        );
      },
    );
  }
}
