import 'package:aak_tele_science/core/theme/app_pallete.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/login_page.dart';
import 'package:aak_tele_science/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Card(
                margin: const EdgeInsets.all(15),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/aak_telesciences_logo.png",
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Please verify your email",
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          "Successfully registered your account. Please check your email (and your spam folder) to verify your email address. The link expires after 10 minutes."),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthGradientButton(
                        isLoading: false,
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()),
                              (route) => false);
                        },
                        buttonText: "Back to Login",
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
