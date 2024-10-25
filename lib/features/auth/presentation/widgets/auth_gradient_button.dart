import 'package:aak_tele_science/core/theme/app_pallete.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AuthGradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool isLoading;
  const AuthGradientButton(
      {super.key,
      required this.onPressed,
      required this.isLoading,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              colors: [AppPallete.gradient1, AppPallete.gradient2])),
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(
              Colors.transparent,
            ),
            shadowColor: const MaterialStatePropertyAll(Colors.transparent)),
        onPressed: onPressed,
        child: isLoading
            ? LoadingIndicator()
            : Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      color: AppPallete.whiteColor,
      size: 18.0,
    );
  }
}
