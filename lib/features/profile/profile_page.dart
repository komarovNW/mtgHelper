import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/utils/auth_notifier.dart';
import 'package:mtg_helper/widgets/app_bar.dart';
import 'package:mtg_helper/widgets/app_drawer.dart';
import 'package:mtg_helper/widgets/app_exchange_switcher.dart';
import 'package:provider/provider.dart';
import 'profile_cubit.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        currentPage: context.l10n.drawerProfile,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
            title: context.l10n.profileTitle,
            needExitButton: true,
          ),
          const _Body(),
        ],
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late AuthNotifier userInfo;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    userInfo = Provider.of<AuthNotifier>(context);
    _emailController.text = userInfo.user?.email ?? '';
    _displayNameController.text = userInfo.user?.displayName ?? '';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: BlocConsumer<ProfileCubit, ProfileState>(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        child: Text(
                          context.l10n.mail,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        readOnly: true,
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Color(0xff474647)),
                        cursorColor: const Color(0xff474647),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff474647),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff474647),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffF45D01),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        child: Text(
                          context.l10n.account,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _displayNameController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Color(0xff474647)),
                        cursorColor: const Color(0xff474647),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xffF45D01),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffF45D01),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xffF45D01),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomRateSwitcher(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<AuthNotifier>()
                          .updateDisplayName(_displayNameController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF45D01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(
                          color: Color(0xffF45D01),
                        ),
                      ),
                    ),
                    child: Text(
                      context.l10n.save,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
