import 'package:flutter/material.dart';
import 'features/onboarding/view/splash_page.dart';
import 'features/auth/view/login_page.dart';
import 'features/register/view/register_page.dart';
import 'features/forgot_password/view/forgot_password_page.dart';
import 'features/home/view/home_page.dart';
import 'features/analyze_text/view/analyze_text_page.dart';
import 'features/result/view/result_page.dart';
import 'features/upload_print/view/upload_print_page.dart';
import 'features/history/view/history_page.dart';
import 'features/settings/view/settings_page.dart';


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
        '/splash':          (_) => const SplashPage(),
        '/login':           (_) => const LoginPage(),
        '/register':        (_) => const RegisterPage(),
        '/forgot-password': (_) => const ForgotPasswordPage(),
        '/home':            (_) => const HomePage(),
        '/analyze-text': (_) => const AnalyzeTextPage(),
        '/result': (_) => const ResultPage(),
        '/upload-print': (_) => const UploadPrintPage(),
        '/history': (_) => const HistoryPage(),
        '/settings': (_) => const SettingsPage(),
        
      },
    );
  }
}