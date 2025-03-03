import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/features/auctions/auctions_router.dart';
import 'package:mtg_helper/features/auth/auth_router.dart';
import 'package:mtg_helper/features/home/home_router.dart';
import 'package:mtg_helper/features/price/price_router.dart';
import 'package:mtg_helper/features/profile/profile_router.dart';

import 'package:mtg_helper/features/score/score_router.dart';
import 'package:mtg_helper/features/search/search_router.dart';

class AppNavigator {
  static void goHome(BuildContext context) => context.go(HomeRoutes.homePath);
  static void goAuth(BuildContext context) => context.go(AuthRoutes.authPath);
  static void goSearch(BuildContext context) =>
      context.go(SearchRoutes.searchPath);
  static void goScore(BuildContext context) =>
      context.go(ScoreRoutes.scorePath);
  static void goAuction(BuildContext context) =>
      context.go(AuctionsRoutes.auctionsPath);
  static void goPrice(BuildContext context, SearchCardModel searchCard) =>
      context.go(PriceRoutes.pricePath, extra: searchCard);
  static void goProfile(BuildContext context) =>
      context.go(ProfileRoutes.profilePath);
}
