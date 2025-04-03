import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

import 'package:mtg_helper/features/registration/registration_cubit.dart';
import 'package:mtg_helper/features/registration/registration_state.dart';
import 'package:mtg_helper/utils/app_navigator.dart';
import 'package:mtg_helper/utils/auth_notifier.dart';
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
  late AuthNotifier userInfo;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listenWhen: (RegistrationState previous, RegistrationState current) =>
          previous.firebaseError != current.firebaseError ||
          previous.isSubmitting != current.isSubmitting,
      listener: (BuildContext context, RegistrationState state) {
        if (state.firebaseError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.firebaseError!),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state.isSubmitting == true) AppNavigator.goScore(context);
      },
      builder: (BuildContext context, RegistrationState state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                AppTextFormField(
                  text: context.l10n.email,
                  controller: _emailController,
                  errorText: state.validationErrors.emailError,
                ),
                // _TextFormField(
                //   label: context.l10n.email,
                //   controller: _emailController,
                //   errorText: state.validationErrors.emailError,
                // ),
                AppTextFormField(
                  text: context.l10n.login,
                  controller: _displayNameController,
                ),
                // _TextFormField(
                //   label: context.l10n.login,
                //   controller: _displayNameController,
                // ),
                AppTextFormField(
                  text: context.l10n.password,
                  controller: _passwordController,
                  obscureText: true,
                  errorText: state.validationErrors.passwordError,
                ),
                // _TextFormField(
                //   label: context.l10n.password,
                //   controller: _passwordController,
                //   obscureText: true,
                //   errorText: state.validationErrors.passwordError,
                // ),
                AppTextFormField(
                  text: context.l10n.repeatPassword,
                  controller: _repeatPasswordController,
                  obscureText: true,
                  errorText: state.validationErrors.repeatPasswordError,
                ),
                // _TextFormField(
                //   label: context.l10n.repeatPassword,
                //   controller: _repeatPasswordController,
                //   obscureText: true,
                //   errorText: state.validationErrors.repeatPasswordError,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 20),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: ElevatedButton(
                //       onPressed: () {
                //         context.read<RegistrationCubit>().validateForm(
                //               email: _emailController.text,
                //               password: _passwordController.text,
                //               repeatPassword: _repeatPasswordController.text,
                //               displayName: _repeatPasswordController.text,
                //             );
                //       },
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: const Color(0xffF45D01),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4),
                //           side: const BorderSide(
                //             color: Color(0xffF45D01),
                //           ),
                //         ),
                //       ),
                //       child: Text(
                //         context.l10n.save,
                //         style: const TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class _TextFormField extends StatelessWidget {
//   const _TextFormField({
//     required this.label,
//     required this.controller,
//     this.obscureText = false,
//     this.errorText,
//   });
//
//   final String label;
//   final TextEditingController controller;
//   final bool obscureText;
//   final String? errorText;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Color(0xff474647),
//             ),
//           ),
//           const SizedBox(
//             height: 6,
//           ),
//           AppTextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             errorText: errorText,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AppTextFormField extends StatelessWidget {
//   const AppTextFormField({
//     super.key,
//     required this.controller,
//     this.obscureText = false,
//     this.errorText,
//   });
//
//   final TextEditingController controller;
//   final bool obscureText;
//   final String? errorText;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       keyboardType: TextInputType.text,
//       style: const TextStyle(color: Color(0xff474647)),
//       cursorColor: const Color(0xffF45D01),
//       decoration: InputDecoration(
//         errorText: errorText,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
//         hintStyle: const TextStyle(
//           fontSize: 14,
//           color: Color(0xffF45D01),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: Color(0xffF45D01),
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: Color(0xffF45D01),
//           ),
//         ),
//       ),
//     );
//   }
// }
