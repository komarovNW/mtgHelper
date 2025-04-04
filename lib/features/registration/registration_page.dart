import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/extension/localization_extension.dart';
import 'package:mtg_helper/features/registration/registration_cubit.dart';
import 'package:mtg_helper/features/registration/registration_state.dart';
import 'package:mtg_helper/utils/app_navigator.dart';
import 'package:mtg_helper/widgets/app_button.dart';
import 'package:mtg_helper/widgets/text_form_fields/app_text_form_field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff474647)),
          onPressed: () {
            /// TODO должен быть pop
            context.go('/auth');
          },
        ),
      ),
      backgroundColor: Colors.white,
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
  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _displayNameController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _repeatPasswordController.addListener(_validateForm);
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFormValid = false;

  void _validateForm() {
    setState(() {
      _isFormValid = _emailController.text.isNotEmpty &&
          _displayNameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _repeatPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listenWhen: (RegistrationState prev, RegistrationState curr) =>
          prev.firebaseError != curr.firebaseError ||
          prev.isSuccess != curr.isSuccess,
      listener: (BuildContext context, RegistrationState state) {
        if (state.firebaseError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.firebaseError!),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state.isSuccess) {
          AppNavigator.goScore(context);
        }
      },
      builder: (BuildContext context, RegistrationState state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 70),
                  AppTextFormField(
                    text: context.l10n.email,
                    controller: _emailController,
                    errorText: state.validationErrors.emailError,
                  ),
                  AppTextFormField(
                    text: context.l10n.login,
                    controller: _displayNameController,
                  ),
                  AppTextFormField(
                    text: context.l10n.password,
                    controller: _passwordController,
                    obscureText: true,
                    errorText: state.validationErrors.passwordError,
                  ),
                  AppTextFormField(
                    text: context.l10n.repeatPassword,
                    controller: _repeatPasswordController,
                    obscureText: true,
                    errorText: state.validationErrors.repeatPasswordError,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: AppButton(
                      text: context.l10n.save,
                      isLoading: state.isSubmitting,
                      onTap: _isFormValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context.read<RegistrationCubit>().validateForm(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      repeatPassword:
                                          _repeatPasswordController.text,
                                      displayName: _displayNameController.text,
                                    );
                              }
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
