

import 'package:flutter/material.dart';
import '../../analyze/view/analyze_page.dart';
//import '../../analyze/viewmodel/analyze_viewmodel.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> login(BuildContext context) async {
  final email = emailController.text;
  final password = passwordController.text;

  if (email.isEmpty || password.isEmpty) {
    return;
  }

  // simulação de loading
  await Future.delayed(const Duration(seconds: 1));

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const AnalyzePage(),
    ),
  );
}
}