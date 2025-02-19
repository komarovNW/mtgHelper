import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/core/di.dart';
import 'package:mtg_helper/features/{{name}}/{{name}}_cubit.dart';
import 'package:mtg_helper/features/{{name}}/{{name}}_page.dart';

abstract class {{name.pascalCase()}}Routes {
  static const String {{name}}Path = '/{{name}}';
  static final GoRoute route = GoRoute(
    path: {{name}}Path,
    builder: (BuildContext context, GoRouterState state) {
      return BlocProvider<{{name.pascalCase()}}Cubit>.value(
        value: DependencyInjectionContainer.{{name}}Factory.create{{name.pascalCase()}}Cubit(),
        child: const {{name.pascalCase()}}Page(),
      );
    },
  );
}
