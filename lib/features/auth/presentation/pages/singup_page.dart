import 'package:aak_tele_science/core/entities/user_type_enum.dart';
import 'package:aak_tele_science/core/theme/app_pallete.dart';
import 'package:aak_tele_science/core/utils/show_snackbar.dart';
import 'package:aak_tele_science/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/login_page.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/verify_email_page.dart';
import 'package:aak_tele_science/features/auth/presentation/widgets/auth_fields.dart';
import 'package:aak_tele_science/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final countryController = TextEditingController();
  List<String> userTypes = [
    "Researcher",
    "Investor",
    "Institution Staff",
    "Service Provider"
  ];
  UserType? selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, state.message);
                } else if (state is AuthSuccess) {
                  if (state.user.status == "successful") {
                    //update Navigator.push to Navigator.pushand removeUntil
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifyEmailPage()),
                        (route) => false);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => VerifyEmailPage()));
                  }
                }
              },
              builder: (context, state) {
                // if (state is AuthLoading) {
                //   return const Loader();
                // }
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/aak_telesciences_logo.png",
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rsgister Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Please enter your details below.",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppPallete.backgroundColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'First Name',
                        controller: firstNameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'Last Name',
                        controller: lastNameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'User Name',
                        controller: userNameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'Country',
                        controller: countryController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          items: userTypes
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          //value: selectedUserType,
                          hint: const Text("User Type"),
                          onChanged: (value) {
                            switch (value) {
                              case "Researcher":
                                selectedUserType = UserType.researcher;
                                break;
                              case "Investor":
                                selectedUserType = UserType.investor;
                                break;
                              case "Institution Staff":
                                selectedUserType = UserType.institution_staff;
                                break;
                              case "Service Provider":
                                selectedUserType = UserType.service_provider;
                                break;
                              default:
                                selectedUserType = null;
                            }
                            print("selectedUserType : $selectedUserType");
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'Create Password',
                        controller: passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthField(
                        hintText: 'Confirm Password',
                        controller: confirmPasswordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthGradientButton(
                          isLoading: state is AuthLoading ? true : false,
                          onPressed: () {
                            print("OnPress called");
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              print("OnPress called inside validte");
                              context.read<AuthBloc>().add(SignUpEvent(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    userType: selectedUserType!,
                                    userName: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    country: countryController.text,
                                  ));
                            }
                          },
                          buttonText: 'Register Account'),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()),
                            (route) => false),
                        child: RichText(
                            text: TextSpan(
                                text: "Do have an account? ",
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                              TextSpan(
                                text: "Sign In",
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
        ),
      ),
    );
  }
}
