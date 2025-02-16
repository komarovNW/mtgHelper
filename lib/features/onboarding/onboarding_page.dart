import 'package:flutter/material.dart';
import 'package:mtg_helper/features/onboarding/components/buttons.dart';
import 'package:mtg_helper/features/onboarding/components/item.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  final List<OnboardingListModel> _onBoardingList = <OnboardingListModel>[
    const OnboardingListModel(
      title: 'Аукционы',
      text: 'Следи и сохраняй интересные тебе аукционы',
      icon: 'assets/png/auction.png',
      color: Colors.red,
    ),
    const OnboardingListModel(
      title: 'Счетчик',
      text: 'Считай жизни свои и оппонента прямо в приложении',
      icon: 'assets/png/count.png',
      color: Colors.blue,
    ),
    const OnboardingListModel(
      title: 'Коллекция',
      text: 'Храни и показывай свою коллекцию с телефона',
      icon: 'assets/png/collection.png',
      color: Colors.orange,
    ),
    const OnboardingListModel(
      title: 'Статистика',
      text: 'Записывай все свои матчи чтобы потом проанализировать',
      icon: 'assets/png/chart.png',
      color: Colors.purple,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: _onBoardingList.length, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: _onBoardingList.map((OnboardingListModel e) => OnboardingItem(item: e)).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TabPageSelector(
                selectedColor: Colors.white,
                controller: _tabController,
              ),
            ),
            OnboardingButtons(
              updateCurrentPageIndex: _updateCurrentPageIndex,
              isLastPage: _currentPageIndex == _onBoardingList.length - 1,
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
