import 'package:flutter/material.dart';
import 'package:mtg_helper/core/app_navigator.dart';
import 'package:mtg_helper/core/auth_notifier.dart';
import 'package:mtg_helper/extension/initials.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthNotifier authInfo = Provider.of<AuthNotifier>(context);
    final List<_DrawerItem> menuItems = <_DrawerItem>[
      _DrawerItem(title: context.l10n.drawerScore, onTap: AppNavigator.goScore),
      _DrawerItem(title: context.l10n.drawerPrice, onTap: AppNavigator.goHome),
      _DrawerItem(
        title: context.l10n.drawerAuctions,
        onTap: AppNavigator.goAuction,
      ),
      _DrawerItem(
        title: context.l10n.drawerStatistic,
      ),
      _DrawerItem(
        title: context.l10n.drawerTrades,
      ),
      _DrawerItem(
        title: context.l10n.drawerCollection,
      ),
      _DrawerItem(
        title: context.l10n.drawerCalendar,
      ),
    ];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              authInfo.user?.displayName ?? 'Гость',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              authInfo.user?.email ?? '',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Text(
                authInfo.user?.displayName?.initials ?? '',
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
          ...menuItems.map((_DrawerItem item) {
            return ListTile(
              title: Text(item.title),
              onTap: () {
                if (item.onTap != null) {
                  item.onTap!(context);
                }
              },
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

class _DrawerItem {
  _DrawerItem({required this.title, this.onTap});
  final String title;
  final void Function(BuildContext context)? onTap;
}
