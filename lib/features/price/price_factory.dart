import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/data/datasources/price/price_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/price/price_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/price/price_repository.dart';
import 'package:mtg_helper/domain/use_cases/price/get_use_case.dart';

import 'package:mtg_helper/features/price/price_cubit.dart';
import 'package:mtg_helper/features/price/price_page.dart';

class PriceFactory {
  PriceFactory({required this.dio});
  final Dio dio;

  PriceRemoteDataSource createPriceDataSource() {
    return PriceRemoteDataSource(dio: dio);
  }

  PriceRepository createPriceRepository() {
    return PriceRepositoryImpl(remoteDataSource: createPriceDataSource());
  }

  GetUseCase createGetUseCase() {
    return GetUseCase(repository: createPriceRepository());
  }

  // FilterUseCase createFilterUseCase() {
  //   return FilterUseCase();
  // }

  PriceCubit createPriceCubit() {
    return PriceCubit(
      // filterUseCase: createFilterUseCase(),
      getUseCase: createGetUseCase(),
    );
  }

  BlocProvider<PriceCubit> createPriceBlocProvider() {
    return BlocProvider<PriceCubit>(
      create: (_) => createPriceCubit(),
      child: const PricePage(),
    );
  }
}
