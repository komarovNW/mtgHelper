import 'package:flutter/material.dart';
import 'package:mtg_helper/data/models/search_card_model.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/price/price_auction/price_auction_page.dart';
import 'package:mtg_helper/features/price/price_scg/price_scg_page.dart';
import 'package:mtg_helper/features/price/price_singles/price_singles_page.dart';
import 'package:mtg_helper/features/price/price_tcg/price_tcg_page.dart';
import 'package:mtg_helper/widgets/app_bar.dart';

class PricePage extends StatefulWidget {
  const PricePage({super.key, required this.searchCard});

  final SearchCardModel searchCard;

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: CustomAppBar(
        height: 100,
        needBackButton: true,
        title: widget.searchCard.localizedName ?? widget.searchCard.name,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xffF45D01),
                width: 3,
              ),
            ),
          ),
          tabs: <Widget>[
            Tab(text: context.l10n.priceTabTCG),
            Tab(text: context.l10n.priceTabSCG),
            Tab(text: context.l10n.priceTabSingles),
            Tab(text: context.l10n.priceTabAuctions),
          ],
        ),
      ),
      body: _Body(tabController: _tabController),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const <Widget>[
        PriceTCGPage(),
        PriceSCGPage(),
        PriceSinglesPage(),
        PriceAuctionPage(),
      ],
    );
  }
}
