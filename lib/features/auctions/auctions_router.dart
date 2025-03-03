import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';

abstract class AuctionsRoutes {
  static const String auctionsPath = '/auctions';
  static final GoRoute route = GoRoute(
    path: auctionsPath,
    builder: (BuildContext context, GoRouterState state) {
      return DependencyInjectionContainer.auctionsFactory.createAuctionsPage();
    },
  );
}
