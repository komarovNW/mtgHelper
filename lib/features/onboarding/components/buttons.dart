import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Positioned(
            left: 1,
            child: GestureDetector(
              onTap: () => context.go('/auth'),
              child: const Text(
                'Пропустить',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            right: 1,
            child: isLastPage
                ? GestureDetector(
                    onTap: () => context.go('/auth'),
                    child: const Text(
                      'Ок',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () => updateCurrentPageIndex(),
                    child: const Text(
                      'Дальше',
                      style: TextStyle(
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
