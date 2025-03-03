import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/profile/profile_cubit.dart';
import 'package:mtg_helper/features/profile/profile_page.dart';

abstract class ProfileRoutes {
  static const String profilePath = '/profile';
  static final GoRoute route = GoRoute(
    path: profilePath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<ProfileCubit>.value(
        value: DependencyInjectionContainer.profileFactory.createProfileCubit(),
        child: const ProfilePage(),
      );
    },
  );
}
