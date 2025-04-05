import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/utils/auth_change_notifier.dart';

const Color _iconColor = Color(0xffF45D01);
const Color _backgroundColor = Color(0xff474647);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.bottom,
    this.title,
    this.isDrawerButton = true,
    this.actions,
    this.height = kToolbarHeight * 1.2,
  }) : preferredSize = Size.fromHeight(height);

  final double height;
  final Widget? title;
  final bool isDrawerButton;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      titleSpacing: 0,
      leading: isDrawerButton ? const DrawerIcon() : const BackButtonWidget(),
      iconTheme: const IconThemeData(color: _iconColor),
      backgroundColor: _backgroundColor,
      title: title,
      actions: actions,
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            final ScaffoldState? scaffold = Scaffold.maybeOf(context);
            if (scaffold != null && scaffold.hasDrawer) {
              scaffold.openDrawer();
            }
          },
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () => context.read<AuthChangeNotifier>().signOut(),
      ),
    );
  }
}
