import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'auth_cubit.dart';
import 'auth_state.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthCubit>(
        create: (_) => AuthCubit(FirebaseAuth.instance),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            state.when(
              initial: () {},
              loading: () {},
              success: (User user) {
                context.go('/home');
              },
              failure: (String error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error)),
                );
              },
            );
          },
          child: Stack(
            children: <Widget>[
              AuthForm(emailController: emailController, passwordController: passwordController),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const LoadingOverlay(),
                    success: (_) => const SizedBox.shrink(),
                    failure: (_) => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final String email = emailController.text;
              final String password = passwordController.text;

              if (email.isNotEmpty && password.isNotEmpty) {
                context.read<AuthCubit>().login(
                      email: email,
                      password: password,
                    );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Пожалуйста, заполните все поля')),
                );
              }
            },
            child: const Text('Войти'),
          ),
        ],
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.3),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
