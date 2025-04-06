import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/datasources/price/auction_remote_data_source.dart';
import 'package:mtg_helper/data/datasources/price/scg_remote_data_source.dart';
import 'package:mtg_helper/data/datasources/price/singles_remote_data_source.dart';
import 'package:mtg_helper/data/datasources/price/tcg_remote_data_source.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/data/repositories/auctions/favorites_auctions_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_auction_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_scg_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_singles_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_tcg_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/auctions/favorites_auctions_repository.dart';

import 'package:mtg_helper/domain/repositories/price/price_auction_repository.dart';
import 'package:mtg_helper/domain/repositories/price/price_scg_repository.dart';
import 'package:mtg_helper/domain/repositories/price/price_singles_repository.dart';
import 'package:mtg_helper/domain/repositories/price/price_tcg_repository.dart';
import 'package:mtg_helper/domain/use_cases/auction/check_favotires_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_favorites_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/toggle_favorites_acution_use_case.dart';

import 'package:mtg_helper/domain/use_cases/price/get_auction_price_card_use_case.dart';
import 'package:mtg_helper/domain/use_cases/price/get_scg_price_card_use_case.dart';
import 'package:mtg_helper/domain/use_cases/price/get_singles_price_card_use_case.dart';
import 'package:mtg_helper/domain/use_cases/price/get_tcg_price_card_use_case.dart';
import 'package:mtg_helper/features/price/price_auction/price_auction_cubit.dart';

import 'package:mtg_helper/features/price/price_page.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_cubit.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_cubit.dart';
import 'package:mtg_helper/features/price/price_tcg/price_tcg_cubit.dart';
import 'package:provider/single_child_widget.dart';

class PriceFactory {
  PriceFactory({required this.dioService});

  final DioService dioService;

  PriceAuctionRemoteDataSource createAuctionRemoteDataSource() {
    return PriceAuctionRemoteDataSource(
      dioService: dioService,
    );
  }

  SCGRemoteDataSource createSCGRemoteDataSource() {
    return SCGRemoteDataSource(
      dioService: dioService,
    );
  }

  SinglesRemoteDataSource createSinglesRemoteDataSource() {
    return SinglesRemoteDataSource(
      dioService: dioService,
    );
  }

  TCGRemoteDataSource createTCGRemoteDataSource() {
    return TCGRemoteDataSource(
      dioService: dioService,
    );
  }

  PriceAuctionRepository createPriceAuctionRepository() {
    return PriceAuctionRepositoryImpl(
      auctionRemoteDataSource: createAuctionRemoteDataSource(),
    );
  }

  PriceSCGRepository createPriceSCGRepository() {
    return PriceSCGRepositoryImpl(
      scgRemoteDataSource: createSCGRemoteDataSource(),
    );
  }

  PriceSinglesRepository createPriceSinglesRepository() {
    return PriceSinglesRepositoryImpl(
      singlesRemoteDataSource: createSinglesRemoteDataSource(),
    );
  }

  PriceTCGRepository createPriceTCGRepository() {
    return PriceTCGRepositoryImpl(
      tcgRemoteDataSource: createTCGRemoteDataSource(),
    );
  }

  FavoritesRepository createFavoritesRepository() {
    return FavoritesRepositoryImpl();
  }

  GetPriceAuctionCardUseCase createGetPriceAuctionCardUseCase() {
    return GetPriceAuctionCardUseCase(
      repository: createPriceAuctionRepository(),
    );
  }

  GetPriceSCGCardUseCase createGetPriceSCGCardUseCase() {
    return GetPriceSCGCardUseCase(
      repository: createPriceSCGRepository(),
    );
  }

  GetPriceSinglesCardUseCase createGetPriceSinglesCardUseCase() {
    return GetPriceSinglesCardUseCase(
      repository: createPriceSinglesRepository(),
    );
  }

  GetPriceTCGCardUseCase createGetPriceTCGCardUseCase() {
    return GetPriceTCGCardUseCase(repository: createPriceTCGRepository());
  }

  ToggleFavoriteUseCase createToggleFavoriteUseCase() {
    return ToggleFavoriteUseCase(repository: createFavoritesRepository());
  }

  GetFavoritesIdsUseCase createGetFavoritesUseCase() {
    return GetFavoritesIdsUseCase(repository: createFavoritesRepository());
  }

  CheckFavoritesAuctionsUseCase createCheckFavoritesAuctionsUseCase() {
    return CheckFavoritesAuctionsUseCase(
      repository: createFavoritesRepository(),
    );
  }

  PriceAuctionCubit createPriceAuctionCubit(SearchCardModel searchCard) {
    return PriceAuctionCubit(
      searchCard: searchCard,
      getPriceAuctionCardUseCase: createGetPriceAuctionCardUseCase(),
      getFavoritesUseCase: createGetFavoritesUseCase(),
      toggleFavoriteUseCase: createToggleFavoriteUseCase(),
      checkFavoritesAuctionsUseCase: createCheckFavoritesAuctionsUseCase(),
    );
  }

  PriceSCGCubit createPriceSCGCubit(SearchCardModel searchCard) {
    return PriceSCGCubit(
      searchCard: searchCard,
      getPriceSCGCardUseCase: createGetPriceSCGCardUseCase(),
    );
  }

  PriceSinglesCubit createPriceSinglesCubit(SearchCardModel searchCard) {
    return PriceSinglesCubit(
      searchCard: searchCard,
      getPriceSinglesCardUseCase: createGetPriceSinglesCardUseCase(),
    );
  }

  PriceTCGCubit createPriceTCGCubit(SearchCardModel searchCard) {
    return PriceTCGCubit(
      searchCard: searchCard,
      getTCGPriceCardUseCase: createGetPriceTCGCardUseCase(),
    );
  }

  Widget createPricePage(SearchCardModel searchCard) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<PriceAuctionCubit>(
          create: (_) => createPriceAuctionCubit(searchCard),
        ),
        BlocProvider<PriceSCGCubit>(
          create: (_) => createPriceSCGCubit(searchCard),
        ),
        BlocProvider<PriceSinglesCubit>(
          create: (_) => createPriceSinglesCubit(searchCard),
        ),
        BlocProvider<PriceTCGCubit>(
          create: (_) => createPriceTCGCubit(searchCard),
        ),
      ],
      child: PricePage(searchCard: searchCard),
    );
  }
}
