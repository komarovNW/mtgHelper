import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/auctions/auctions_cubit.dart';
import 'package:mtg_helper/features/auctions/auctions_page.dart';

abstract class AuctionsRoutes {
  static const String auctionsPath = '/auctions';
  static final GoRoute route = GoRoute(
    path: auctionsPath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<AuctionsCubit>.value(
        value:
            DependencyInjectionContainer.auctionsFactory.createAuctionsCubit(),
        child: const AuctionsPage(),
      );
    },
  );
}
