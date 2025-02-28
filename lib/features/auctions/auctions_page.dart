import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/features/auctions/components/auctions_card.dart';
import 'auctions_cubit.dart';
import 'package:mtg_helper/utils/debouncer.dart';
import 'auctions_state.dart';

class AuctionsPage extends StatefulWidget {
  const AuctionsPage({super.key});

  @override
  State<AuctionsPage> createState() => _AuctionsPageState();
}

class _AuctionsPageState extends State<AuctionsPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 300));
  String _previousQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<AuctionsCubit>().initProcess();
  }

  void _onSearchChanged(String query) {
    if (query == _previousQuery) return;
    _debouncer.run(() {
      if (query.length >= 3) {
        context.read<AuctionsCubit>().filter(query);
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else if (_previousQuery.length >= 3 && query.length < 3) {
        context.read<AuctionsCubit>().reset();
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
    context.read<AuctionsCubit>().reset();
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        currentPage: context.l10n.drawerAuctions,
      ),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            CustomAppBar(
              searchController: _searchController,
              onChange: _onSearchChanged,
              onTapIcon: _onTapIcon,
            ),
            const _Body(),
          ],
        ),
      ),
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
    return BlocConsumer<AuctionsCubit, AuctionsState>(
      listener: (BuildContext context, AuctionsState state) {},
      builder: (BuildContext context, AuctionsState state) {
        return state.map(
          success: (AuctionsSuccess state) {
            if (state.allAuctions.isEmpty) {
              return SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(context.l10n.auctionEmptyList),
                ),
              );
            } else {
              return SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => AuctionCard(
                      item: state.allAuctions[index],
                    ),
                    childCount: state.allAuctions.length,
                  ),
                ),
              );
            }
          },
          loading: (_) => const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Color(0xffF45D01),
                ),
              ),
            ),
          ),
          failure: (_) => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(context.l10n.failure),
            ),
          ),
        );
      },
    );
  }
}
