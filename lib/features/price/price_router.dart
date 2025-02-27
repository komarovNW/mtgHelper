import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/price/price_cubit.dart';
import 'package:mtg_helper/features/price/price_page.dart';

abstract class PriceRoutes {
  static const String pricePath = '/price';
  static final GoRoute route = GoRoute(
    path: pricePath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<PriceCubit>.value(
        value: DependencyInjectionContainer.priceFactory.createPriceCubit(),
        child: const PricePage(),
      );
    },
  );
}
