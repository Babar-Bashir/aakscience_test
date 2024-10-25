import 'package:aak_tele_science/core/theme/theme.dart';
import 'package:aak_tele_science/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/login_page.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/singup_page.dart';
import 'package:aak_tele_science/features/auth/presentation/pages/verify_email_page.dart';
import 'package:aak_tele_science/features/home/presentation/pages/home_page.dart';
import 'package:aak_tele_science/init_dependencies_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAK Tele Science',
      theme: AppTheme.lightThemeMode,
      home: const SignInPage(),
    );
  }
}
