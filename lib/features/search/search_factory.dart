import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/dio_client.dart';
import 'package:mtg_helper/data/datasources/search_remote_data_source.dart';
import 'package:mtg_helper/data/repositories/search_repository_impl.dart';
import 'package:mtg_helper/domain/repositories/search_repository.dart';
import 'package:mtg_helper/domain/use_cases/search/get_search_cards_use_case.dart';
import 'package:mtg_helper/features/search/search_cubit.dart';
import 'package:mtg_helper/features/search/search_page.dart';

class SearchFactory {
  SearchFactory({required this.dioService});

  final DioService dioService;

  SearchRemoteDataSource createSearchDataSource() {
    return SearchRemoteDataSource(
      dioService: dioService,
    );
  }

  SearchRepository createSearchRepository() {
    return SearchRepositoryImpl(remoteDataSource: createSearchDataSource());
  }

  GetSearchCardsUseCase createGetUseCase() {
    return GetSearchCardsUseCase(repository: createSearchRepository());
  }

  SearchCubit createSearchCubit() {
    return SearchCubit(
      getListOfSearchCardsUseCase: createGetUseCase(),
    );
  }

  Widget createSearchPage() {
    return BlocProvider<SearchCubit>(
      create: (_) => createSearchCubit(),
      child: const SearchPage(),
    );
  }
}
