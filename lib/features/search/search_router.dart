import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/search/search_cubit.dart';
import 'package:mtg_helper/features/search/search_page.dart';

abstract class SearchRoutes {
  static const String searchPath = '/search';
  static final GoRoute route = GoRoute(
    path: searchPath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<SearchCubit>.value(
        value: DependencyInjectionContainer.searchFactory.createSearchCubit(),
        child: const SearchPage(),
      );
    },
  );
}
