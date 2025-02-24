import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/auction/auction_cubit.dart';
import 'package:mtg_helper/features/auction/auction_page.dart';

class AuctionFactory {
  AuctionFactory();

  AuctionCubit createAuctionCubit() {
    return AuctionCubit();
  }

  BlocProvider<AuctionCubit> createAuctionBlocProvider() {
    return BlocProvider<AuctionCubit>(
      create: (_) => createAuctionCubit(),
      child: const AuctionPage(),
    );
  }
}
