import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/notifier/auth_change_notifier.dart';
import 'package:mtg_helper/widgets/switchers/app_auction_card_switcher.dart';
import 'package:mtg_helper/widgets/switchers/app_player_count_switcher.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_button.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/switchers/app_custom_course_switcher.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_text_form_field.dart';
import 'package:provider/provider.dart';

import 'profile_cubit.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: TitleWidget(
          title: context.l10n.profileTitle,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => context.read<AuthChangeNotifier>().signOut(),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        currentPage: context.l10n.drawerProfile,
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late AuthChangeNotifier userInfo;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userInfo = Provider.of<AuthChangeNotifier>(context);
    _emailController.text = userInfo.user?.email ?? '';
    _displayNameController.text = userInfo.user?.displayName ?? '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (BuildContext context, ProfileState state) {},
      builder: (BuildContext context, ProfileState state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppTextFormField(
                      text: context.l10n.mail,
                      controller: _emailController,
                      readOnly: true,
                    ),
                    const HBox(8),
                    AppTextFormField(
                      text: context.l10n.account,
                      controller: _displayNameController,
                    ),
                    const HBox(16),
                    const AppCustomCourseSwitcher(),
                    const HBox(16),
                    const AppAuctionCardSwitcher(),
                    const HBox(16),
                    const AppPlayerCountSwitcher(),
                  ],
                ),
              ),
              AppButton(
                text: context.l10n.save,
                onTap: () {
                  context
                      .read<AuthChangeNotifier>()
                      .updateDisplayName(_displayNameController.text);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
