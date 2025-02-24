import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/auction/auction_cubit.dart';
import 'package:mtg_helper/features/auction/auction_page.dart';

abstract class AuctionRoutes {
  static const String auctionPath = '/auction';
  static final GoRoute route = GoRoute(
    path: auctionPath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<AuctionCubit>.value(
        value: DependencyInjectionContainer.auctionFactory.createAuctionCubit(),
        child: const AuctionPage(),
      );
    },
  );
}
