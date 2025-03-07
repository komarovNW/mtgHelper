import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/auctions/components/auction_body.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/app_error.dart';
import 'package:mtg_helper/widgets/app_loader.dart';
import 'package:mtg_helper/utils/debouncer.dart';

import 'auctions_cubit.dart';
import 'auctions_state.dart';

class AuctionsPage extends StatefulWidget {
  const AuctionsPage({super.key});

  @override
  State<AuctionsPage> createState() => _AuctionsPageState();
}

class _AuctionsPageState extends State<AuctionsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 300));
  String _previousQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<AuctionsCubit>().initProcess();
  }

  void _onSearchChanged(String query) {
    if (query == _previousQuery) return;
    _debouncer.run(() {
      final AuctionsCubit cubit = context.read<AuctionsCubit>();
      if (query.length >= 3) {
        cubit.filter(query);
        _scrollController.jumpTo(0);
      } else if (_previousQuery.length >= 3 && query.length < 3) {
        cubit.reset();
      }
      _previousQuery = query;
    });
  }

  void _onTapIcon() {
    _scrollController.jumpTo(0);
    context.read<AuctionsCubit>().reset();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      drawer: AppDrawer(currentPage: context.l10n.drawerAuctions),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => <Widget>[
          CustomAppBar(
            searchController: _searchController,
            onChange: _onSearchChanged,
            onTapIcon: _onTapIcon,
            bottom: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xffF45D01), width: 3),
                ),
              ),
              tabs: <Widget>[
                Tab(text: context.l10n.auctionTabAll),
                Tab(text: context.l10n.auctionTabFavorites),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            _AuctionListView(isFavorites: false),
            _AuctionListView(isFavorites: true),
          ],
        ),
      ),
    );
  }
}

class _AuctionListView extends StatelessWidget {
  const _AuctionListView({required this.isFavorites});
  final bool isFavorites;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuctionsCubit, AuctionsState>(
      listener: (_, __) {},
      builder: (BuildContext context, AuctionsState state) {
        return state.map(
          success: (AuctionsSuccess state) => AuctionsBody(
            favoriteAuctions: state.favoriteAuctions,
            allAuctions: state.allAuctions,
            favoritesIds: state.favoritesIds,
            isFavorites: isFavorites,
          ),
          loading: (_) => const AppLoader(),
          failure: (AuctionsFailure state) => AppError(error: state.error),
        );
      },
    );
  }
}
