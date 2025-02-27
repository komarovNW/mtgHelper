import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/debouncer.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/core/drawer.dart';
import 'package:mtg_helper/features/price/components/price_card.dart';
import 'package:mtg_helper/features/price/components/price_search_text_form_field.dart';
import 'price_cubit.dart';
import 'price_state.dart';

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 300));
  String _previousQuery = '';

  void _onSearchChanged(String query) {
    if (query == _previousQuery) return;
    _debouncer.run(() {
      if (query.length >= 3) {
        context.read<PriceCubit>().search(query);
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else if (_previousQuery.length >= 3 && query.length < 3) {
        context.read<PriceCubit>().reset();
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
    context.read<PriceCubit>().reset();
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
      drawer: const AppDrawer(),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 70.0,
              titleSpacing: 0,
              floating: true,
              snap: true,
              leading: Builder(
                builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
              iconTheme: const IconThemeData(
                color: Color(0xffF45D01),
              ),
              backgroundColor: const Color(0xff474647),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: PriceSearchTextFormField(
                  searchController: _searchController,
                  test: _onSearchChanged,
                  onTapIcon: _onTapIcon,
                ),
              ),
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
    return BlocConsumer<PriceCubit, PriceState>(
      listener: (BuildContext context, PriceState state) {},
      builder: (BuildContext context, PriceState state) {
        return state.map(
          success: (PriceSuccess state) =>
              PriceSuccessBody(allCards: state.allCards),
          initial: (_) => const PriceInitialBody(),
          loading: (_) => const PriceLoadingBody(),
          failure: (_) => const PriceFailureBody(),
        );
      },
    );
  }
}

class PriceLoadingBody extends StatelessWidget {
  const PriceLoadingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class PriceInitialBody extends StatelessWidget {
  const PriceInitialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            context.l10n.priceBodyInitial,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class PriceFailureBody extends StatelessWidget {
  const PriceFailureBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PriceSuccessBody extends StatelessWidget {
  const PriceSuccessBody({super.key, required this.allCards});
  final List<SearchCardModel> allCards;

  @override
  Widget build(BuildContext context) {
    if (allCards.isEmpty) {
      return SliverPadding(
        padding: const EdgeInsets.all(8),
        sliver: SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              context.l10n.priceBodyEmpty,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      return SliverPadding(
        padding: const EdgeInsets.all(14),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) =>
                PriceCard(item: allCards[index]),
            childCount: allCards.length,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 5,
            childAspectRatio: 0.6,
          ),
        ),
      );
    }
  }
}
