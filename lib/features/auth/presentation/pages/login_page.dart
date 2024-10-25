import 'dart:convert';

import 'package:aak_tele_science/core/theme/app_pallete.dart';
import 'package:aak_tele_science/core/utils/show_snackbar.dart';
import 'package:aak_tele_science/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/singup_page.dart';
import 'package:aak_tele_science/features/auth/presentation/widgets/auth_fields.dart';
import 'package:aak_tele_science/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:aak_tele_science/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              print("LoginSCREEN ${state.message}");
              showSnackBar(context, jsonDecode(state.message)['detail']);

              if (state is AuthSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false);
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/aak_telesciences_logo.png",
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up.',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthField(
                    hintText: 'Username',
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AuthGradientButton(
                      isLoading: state is AuthLoading ? true : false,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context.read<AuthBloc>().add(SignInEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        }
                      },
                      buttonText: 'Sign In'),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                          (route) => false);
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                          TextSpan(
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppPallete.gradient1),
                          ),
                        ])),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
