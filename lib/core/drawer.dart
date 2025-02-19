import 'package:flutter/material.dart';
import 'package:mtg_helper/core/auth_notifier.dart';
import 'package:mtg_helper/core/user_notifier.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = <String>[
      context.l10n.drawerScore,
      context.l10n.drawerPrice,
      context.l10n.drawerAuctions,
      context.l10n.drawerStatistic,
      context.l10n.drawerTrades,
      context.l10n.drawerCollection,
      context.l10n.drawerCalendar,
    ];
    final UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              userNotifier.user?.fullName ?? '',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              userNotifier.user?.email ?? '',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Text(
                userNotifier.user?.getInitials() ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          ...menuItems.map((String item) {
            return ListTile(
              title: Text(item),
              onTap: () {},
            );
          }),
          ListTile(
            title: Text(context.l10n.exit),
            onTap: () async {
              await context.read<AuthNotifier>().signOut();
            },
          ),
        ],
      ),
    );
  }
}
