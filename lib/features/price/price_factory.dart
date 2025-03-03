import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/price/auction_remote_data_source.dart';
import 'package:mtg_helper/data/datasources/price/scg_remote_data_source.dart';
import 'package:mtg_helper/data/datasources/price/singles_remote_data_source.dart';
import 'package:mtg_helper/data/datasources/price/tcg_remote_data_source.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/data/repositories/price/price_auction_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_scg_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_singles_repository_impl.dart';
import 'package:mtg_helper/data/repositories/price/price_tcg_repository_impl.dart';

import 'package:mtg_helper/domain/repositories/price/price_auction_repository.dart';
import 'package:mtg_helper/domain/repositories/price/price_scg_repository.dart';
import 'package:mtg_helper/domain/repositories/price/price_singles_repository.dart';
import 'package:mtg_helper/domain/repositories/price/price_tcg_repository.dart';

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
  PriceFactory({required this.dio});
  final Dio dio;

  PriceAuctionRemoteDataSource createAuctionRemoteDataSource() {
    return PriceAuctionRemoteDataSource(dio: dio);
  }

  SCGRemoteDataSource createSCGRemoteDataSource() {
    return SCGRemoteDataSource(dio: dio);
  }

  SinglesRemoteDataSource createSinglesRemoteDataSource() {
    return SinglesRemoteDataSource(dio: dio);
  }

  TCGRemoteDataSource createTCGRemoteDataSource() {
    return TCGRemoteDataSource(dio: dio);
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

  PriceAuctionCubit createPriceAuctionCubit(SearchCardModel searchCard) {
    return PriceAuctionCubit(
      searchCard: searchCard,
      getPriceAuctionCardUseCase: createGetPriceAuctionCardUseCase(),
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
