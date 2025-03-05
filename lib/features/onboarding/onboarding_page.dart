import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/onboarding/components/buttons.dart';
import 'package:mtg_helper/features/onboarding/components/item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex() {
    _tabController.index = _currentPageIndex;
    _pageViewController.animateToPage(
      _currentPageIndex + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  _list(BuildContext context) {
    return <OnboardingListModel>[
      OnboardingListModel(
        title: context.l10n.onboardingTitle1,
        text: context.l10n.onboardingText1,
        icon: 'assets/png/auctions.png',
        color: Colors.red,
      ),
      OnboardingListModel(
        title: context.l10n.onboardingTitle2,
        text: context.l10n.onboardingText2,
        icon: 'assets/png/count.png',
        color: Colors.blue,
      ),
      OnboardingListModel(
        title: context.l10n.onboardingTitle3,
        text: context.l10n.onboardingText3,
        icon: 'assets/png/collection.png',
        color: Colors.orange,
      ),
      OnboardingListModel(
        title: context.l10n.onboardingTitle4,
        text: context.l10n.onboardingText4,
        icon: 'assets/png/chart.png',
        color: Colors.purple,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingListModel> onBoardingList = _list(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: onBoardingList
                  .map(
                    (OnboardingListModel e) => OnboardingItem(
                      item: e,
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: TabPageSelector(
                selectedColor: Colors.white,
                controller: _tabController,
              ),
            ),
            OnboardingButtons(
              updateCurrentPageIndex: _updateCurrentPageIndex,
              isLastPage: _currentPageIndex == onBoardingList.length - 1,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingListModel {
  const OnboardingListModel({
    required this.title,
    required this.text,
    required this.color,
    this.icon = '',
  });
  final String title;
  final String text;
  final String icon;
  final Color? color;
}
