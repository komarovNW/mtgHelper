import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/core/drawer.dart';
import 'package:mtg_helper/features/auction/components/auction_body.dart';
import 'package:mtg_helper/features/auction/components/search_text_form_field.dart';
import 'auction_cubit.dart';
import 'auction_state.dart';

class AuctionPage extends StatefulWidget {
  const AuctionPage({super.key});

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;
  String _previousQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<AuctionCubit>().initProcess();
    _listenScrollController();
    _listenSearchTextField();
  }

  _listenScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<AuctionCubit>().loadMore();
      }
    });
  }

  _listenSearchTextField() {
    _searchController.addListener(
      () {
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(
          const Duration(milliseconds: 300),
          () {
            final String query = _searchController.text;

            if (query.length >= 3) {
              context.read<AuctionCubit>().filter(query);
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else if (_previousQuery.length >= 3 && query.length < 3) {
              context.read<AuctionCubit>().reset();
            }
            _previousQuery = query;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      /// TODO при success не работает скролл AppBar так как внутри билдер
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(context.l10n.auctionTitle),
              // floating: true,
              // snap: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchTextField(
                    searchController: _searchController,
                    onTapIcon: () {
                      context.read<AuctionCubit>().reset();
                      _searchController.clear();
                    },
                  ),
                ),
              ),
            ),
          ];
        },
        body: _Body(scrollController: _scrollController),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuctionCubit, AuctionState>(
      listener: (BuildContext context, AuctionState state) {},
      child: BlocBuilder<AuctionCubit, AuctionState>(
        builder: (BuildContext context, AuctionState state) {
          return state.map(
            success: (AuctionSuccess state) {
              if (state.allAuctions.isEmpty) {
                return Center(
                  child: Text(context.l10n.auctionEmptyList),
                );
              } else {
                return AuctionBody(
                  list: state.allAuctions,
                  scrollController: widget._scrollController,
                  hasMore: state.hasMore,
                );
              }
            },
            loading: (_) => const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            ),
            failure: (_) => Center(
              child: Text(context.l10n.auctionErrorList),
            ),
          );
        },
      ),
    );
  }
}
