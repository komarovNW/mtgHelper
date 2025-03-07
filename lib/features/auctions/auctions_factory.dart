import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/datasources/auctions_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/auctions/auctions_repository_impl.dart';
import 'package:mtg_helper/data/repositories/auctions/favorites_auctions_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/auctions/auctions_repository.dart';
import 'package:mtg_helper/domain/repositories/auctions/favorites_auctions_repository.dart';
import 'package:mtg_helper/domain/use_cases/auction/check_favotires_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/filter_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_favorites_auctions_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/toggle_favorites_acution_use_case.dart';

import 'package:mtg_helper/features/auctions/auctions_cubit.dart';
import 'package:mtg_helper/features/auctions/auctions_page.dart';

class AuctionsFactory {
  AuctionsFactory({required this.dioService});

  final DioService dioService;

  AuctionsRemoteDataSource createAuctionsDataSource() {
    return AuctionsRemoteDataSource(
      dioService: dioService,
    );
  }

  AuctionsRepository createAuctionsRepository() {
    return AuctionsRepositoryImpl(remoteDataSource: createAuctionsDataSource());
  }

  FavoritesRepository createFavoritesRepository() {
    return FavoritesRepositoryImpl();
  }

  GetAuctionsUseCase createGetUseCase() {
    return GetAuctionsUseCase(repository: createAuctionsRepository());
  }

  FilterUseCase createFilterUseCase() {
    return FilterUseCase();
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

  AuctionsCubit createAuctionsCubit() {
    return AuctionsCubit(
      filterUseCase: createFilterUseCase(),
      getAuctionsUseCase: createGetUseCase(),
      getFavoritesUseCase: createGetFavoritesUseCase(),
      toggleFavoriteUseCase: createToggleFavoriteUseCase(),
      checkFavoritesAuctionsUseCase: createCheckFavoritesAuctionsUseCase(),
    );
  }

  Widget createAuctionsPage() {
    return BlocProvider<AuctionsCubit>(
      create: (_) => createAuctionsCubit(),
      child: const AuctionsPage(),
    );
  }
}
