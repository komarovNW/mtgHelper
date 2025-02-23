import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_helper/core/app_navigator.dart';
import 'package:mtg_helper/extension/localization.dart';
import 'package:mtg_helper/widgets/app_box.dart';
import 'package:mtg_helper/features/auth/components/button.dart';
import 'package:mtg_helper/features/auth/components/login_text_form_field.dart';
import 'package:mtg_helper/features/auth/components/password_text_form_field.dart';

import 'auth_cubit.dart';
import 'auth_state.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
  final TextEditingController _loginController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _loginController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) {
        state.maybeWhen(
          success: () => AppNavigator.goHome(context),
          failure: (String error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error), backgroundColor: Colors.red),
              );
            });
          },
          orElse: () {},
        );
      },
      builder: (BuildContext context, AuthState state) {
        return Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  context.l10n.authApp,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const HBox(12),
                Text(context.l10n.authText),
                const HBox(36),
                LoginTextField(loginController: _loginController),
                const HBox(12),
                PasswordTextField(passwordController: _passwordController),
                const HBox(12),
                Button(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                            email: _loginController.text,
                            password: _passwordController.text,
                          );
                    }
                  },
                  isLoading: state is AuthLoading,
                  isValid: _isFormValid,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _loginController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);
    super.dispose();
  }
}
