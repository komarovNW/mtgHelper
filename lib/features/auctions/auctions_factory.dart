import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/auctions/auctions_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/auctions/auctions_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/auction/auctions_repository.dart';
import 'package:mtg_helper/domain/use_cases/auction/filter_use_case.dart';
import 'package:mtg_helper/domain/use_cases/auction/get_use_case.dart';

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

  GetUseCase createGetUseCase() {
    return GetUseCase(repository: createAuctionsRepository());
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

  BlocProvider<AuctionsCubit> createAuctionsBlocProvider() {
    return BlocProvider<AuctionsCubit>(
      create: (_) => createAuctionsCubit(),
      child: const AuctionsPage(),
    );
  }
}
