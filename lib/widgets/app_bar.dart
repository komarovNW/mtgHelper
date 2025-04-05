import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/features/matches/match_record/match_record_router.dart';
import 'package:mtg_helper/features/matches/matches/matches_router.dart';
import 'package:mtg_helper/utils/auth_change_notifier.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_search_text_form_field.dart';

const Color _iconColor = Color(0xffF45D01);
const Color _backgroundColor = Color(0xff474647);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.searchController,
    this.onTapIcon,
    this.onChange,
    this.title,
    this.bottom,
    this.needBackButton = false,
    this.needExitButton = false,
    this.needAddButton = false,
    this.height = kToolbarHeight * 1.2,
  }) : preferredSize = Size.fromHeight(height);

  final TextEditingController? searchController;
  final VoidCallback? onTapIcon;
  final Function(String)? onChange;
  final String? title;
  final PreferredSizeWidget? bottom;
  final bool needBackButton;
  final bool needExitButton;
  final bool needAddButton;

  final double height;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      titleSpacing: 0,
      leading: needBackButton ? const BackButtonWidget() : const DrawerIcon(),
      iconTheme: const IconThemeData(color: _iconColor),
      backgroundColor: _backgroundColor,
      title: title != null
          ? TitleWidget(title: title!)
          : searchController != null && onChange != null && onTapIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                  child: AppSearchTextFormField(
                    searchController: searchController!,
                    onChange: onChange!,
                    onTapIcon: onTapIcon!,
                  ),
                )
              : null,
      actions: needExitButton
          ? const <Widget>[ExitButton()]
          : needAddButton
              ? const <Widget>[AddButton()]
              : null,
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

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => context.go(
          '${MatchesRoutes.matchesPath}/${MatchRecordRoutes.matchRecordPath}',
        ),
      ),
    );
  }
}
