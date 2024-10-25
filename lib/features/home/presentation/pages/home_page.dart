import 'package:aak_tele_science/features/auth/presentation/pages/login_page.dart';
import 'package:aak_tele_science/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 5,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: AuthGradientButton(
            isLoading: false,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                  (route) => false);
            },
            buttonText: "Logout",
          ),
        ),
      ),
    );
  }
}
