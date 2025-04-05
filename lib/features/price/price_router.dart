import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';

abstract class PriceRoutes {
  static const String pricePath = 'price';
  static final GoRoute route = GoRoute(
    path: pricePath,
    builder: (BuildContext context, GoRouterState state) {
      final SearchCardModel searchCard = state.extra as SearchCardModel;
      return DependencyInjectionContainer.priceFactory
          .createPricePage(searchCard);
    },
  );
}
