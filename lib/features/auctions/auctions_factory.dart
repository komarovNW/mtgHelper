import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/auctions_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/auctions_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/auctions_repository.dart';
import 'package:mtg_helper/domain/use_cases/auction/filter_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_auctions_use_case.dart';

import 'package:mtg_helper/features/auctions/auctions_cubit.dart';
import 'package:mtg_helper/features/auctions/auctions_page.dart';

class AuctionsFactory {
  AuctionsFactory({required this.dio});
  final Dio dio;

  AuctionsRemoteDataSource createAuctionsDataSource() {
    return AuctionsRemoteDataSource(dio: dio);
  }

  AuctionsRepository createAuctionsRepository() {
    return AuctionsRepositoryImpl(remoteDataSource: createAuctionsDataSource());
  }

  GetAuctionsUseCase createGetUseCase() {
    return GetAuctionsUseCase(repository: createAuctionsRepository());
  }

  FilterUseCase createFilterUseCase() {
    return FilterUseCase();
  }

  AuctionsCubit createAuctionsCubit() {
    return AuctionsCubit(
      filterUseCase: createFilterUseCase(),
      getUseCase: createGetUseCase(),
    );
  }

  Widget createAuctionsPage() {
    return BlocProvider<AuctionsCubit>(
      create: (_) => createAuctionsCubit(),
      child: const AuctionsPage(),
    );
  }
}
