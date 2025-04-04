import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/auth_change_notifier.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/widgets/app_button.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/app_exchange_switcher.dart';
import 'package:provider/provider.dart';
import '../../widgets/text_form_fields/app_text_form_field.dart';
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
                    const CustomRateSwitcher(),
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
