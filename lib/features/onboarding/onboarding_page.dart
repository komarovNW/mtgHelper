import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('onboarding'),
      ),
      body: Center(
        child: ElevatedButton(
          // foreground
          onPressed: () async {
            context.go('/auth');
          },
          child: const Text('auth'),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
