import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/app_navigator.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/core/app_drawer.dart';
import '{{name}}_cubit.dart';
import '{{name}}_state.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: const AppDrawer(),
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
          "{{name.pascalCase()}} Page",
        ),
      ),
    body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
      listener: (BuildContext context, {{name.pascalCase()}}State state) {
      },
      child: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
        builder: (BuildContext context, {{name.pascalCase()}}State state) {
          return Center(
              child: Text("{{name.pascalCase()}} Page",),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
