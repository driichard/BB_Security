import 'package:flutter/material.dart';

class ForgotPasswordViewModel extends ChangeNotifier {
  final emailController = TextEditingController();

  bool isLoading = false;
  bool emailSent = false;
  String? errorMessage;

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<void> sendResetLink(BuildContext context) async {
    final email = emailController.text.trim();

    // Verifica se o campo está vazio
    if (email.isEmpty) {
      errorMessage = 'Digite seu e-mail.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Simula envio — trocar pelo banco de dados depois
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    emailSent = true;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}