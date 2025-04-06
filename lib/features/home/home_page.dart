import 'package:flutter/material.dart';

import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthChangeNotifier authNotifier =
        Provider.of<AuthChangeNotifier>(context);
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          context.l10n.homeTitle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.l10n.homeText),
            Text(authNotifier.user?.displayName ?? 'Гость'),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
