import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/features/search/components/search_card.dart';
import 'package:mtg_helper/utils/debouncer.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_search_text_form_field.dart';

import 'search_cubit.dart';
import 'search_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 300));
  String _previousQuery = '';

  void _onSearchChanged(String query) {
    if (query == _previousQuery) return;
    _debouncer.run(() {
      if (query.length >= 3) {
        context.read<SearchCubit>().search(query);
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else if (_previousQuery.length >= 3 && query.length < 3) {
        context.read<SearchCubit>().reset();
      }
      _previousQuery = query;
    });
  }

  void _onTapIcon() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    context.read<SearchCubit>().reset();
    _searchController.clear();
  }

  @override
  void dispose() {
    _debouncer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(currentPage: context.l10n.drawerSearch),
      appBar: CustomAppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 16.0),
          child: AppSearchTextFormField(
            searchController: _searchController,
            onChange: _onSearchChanged,
            onTapIcon: _onTapIcon,
          ),
        ),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (BuildContext context, SearchState state) {},
      builder: (BuildContext context, SearchState state) {
        return state.map(
          success: (SearchSuccess state) =>
              SearchSuccessBody(allCards: state.allCards),
          initial: (_) => const SearchInitialBody(),
          loading: (_) => const AppLoader(),
          failure: (SearchFailure state) => AppError(error: state.error),
        );
      },
    );
  }
}

class SearchInitialBody extends StatelessWidget {
  const SearchInitialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          context.l10n.searchBodyInitial,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SearchSuccessBody extends StatelessWidget {
  const SearchSuccessBody({super.key, required this.allCards});
  final List<SearchCardModel> allCards;

  @override
  Widget build(BuildContext context) {
    if (allCards.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            context.l10n.searchBodyEmpty,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(14),
        child: GridView.builder(
          itemCount: allCards.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 5,
            childAspectRatio: 0.6,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SearchCard(item: allCards[index]);
          },
        ),
      );
    }
  }
}
