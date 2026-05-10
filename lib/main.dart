import 'package:flutter/material.dart';
import 'features/register/view/register_page.dart';
import 'features/onboarding/view/splash_page.dart';
import 'features/auth/view/login_page.dart';
import 'features/forgot_password/view/forgot_password_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login':  (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/forgot-password': (_) => const ForgotPasswordPage(),
        // adiciona as rotas aqui conforme for criando as telas
      },
    );
  }
}