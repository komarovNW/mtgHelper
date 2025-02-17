import 'package:flutter/material.dart';
import 'package:mtg_helper/core/app_navigator.dart';
import 'package:mtg_helper/extension/localization.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({
    super.key,
    required this.updateCurrentPageIndex,
    required this.isLastPage,
  });
  final Function updateCurrentPageIndex;
  final bool isLastPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 26.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          if (!isLastPage)
            Positioned(
              left: 1,
              child: GestureDetector(
                onTap: () => AppNavigator.goAuth(context),
                child: Text(
                  context.l10n.skip,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Positioned(
            right: 1,
            child: GestureDetector(
              onTap: () => isLastPage
                  ? AppNavigator.goAuth(context)
                  : updateCurrentPageIndex(),
              child: Text(
                isLastPage ? context.l10n.ok : context.l10n.next,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
