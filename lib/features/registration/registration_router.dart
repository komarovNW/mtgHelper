import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/registration/registration_cubit.dart';
import 'package:mtg_helper/features/registration/registration_page.dart';

abstract class RegistrationRoutes {
  static const String registrationPath = '/registration';
  static final GoRoute route = GoRoute(
    path: registrationPath,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<RegistrationCubit>.value(
        value: DependencyInjectionContainer.registrationFactory
            .createRegistrationCubit(),
        child: const RegistrationPage(),
      );
    },
  );
}
