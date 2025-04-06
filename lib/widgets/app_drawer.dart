import 'package:flutter/material.dart';
import 'package:mtg_helper/utils/app_navigator.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';
import 'package:mtg_helper/extension/initials_extension.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, this.currentPage = ''});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    final AuthChangeNotifier authInfo =
        Provider.of<AuthChangeNotifier>(context);
    final List<_DrawerItem> menuItems = <_DrawerItem>[
      _DrawerItem(
        title: context.l10n.drawerProfile,
        onTap: AppNavigator.goProfile,
      ),
      _DrawerItem(
        title: context.l10n.drawerScore,
        onTap: AppNavigator.goScore,
      ),
      _DrawerItem(
        title: context.l10n.drawerSearch,
        onTap: AppNavigator.goSearch,
      ),
      _DrawerItem(
        title: context.l10n.drawerAuctions,
        onTap: AppNavigator.goAuction,
      ),
      _DrawerItem(
        title: context.l10n.drawerMatches,
        onTap: AppNavigator.goMatches,
      ),
      _DrawerItem(
        title: 'Календарь',
        onTap: AppNavigator.goCalendar,
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
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              authInfo.user?.email ?? '',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color(0xffF45D01),
              child: Text(
                authInfo.user?.displayName?.initials ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xff474647),
            ),
          ),
          ...menuItems.map(
            (_DrawerItem item) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    if (item.onTap != null) {
                      item.onTap!(context);
                    }
                  },
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: currentPage == item.title
                          ? const Color(0xffF45D01)
                          : const Color(0xff474647),
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  _DrawerItem({
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function(BuildContext context)? onTap;
}
