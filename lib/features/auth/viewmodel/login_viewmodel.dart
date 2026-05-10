import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;
  String? errorMessage;

  // Dados fake — trocar pelo banco de dados depois
  final String _fakeEmail = 'teste@bb.com';
  final String _fakePassword = '123456';

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  // Limpa o erro quando o usuário começa a digitar
  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      errorMessage = 'Preencha todos os campos.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;

    if (email != _fakeEmail || password != _fakePassword) {
      errorMessage = 'E-mail ou senha incorretos.';
      notifyListeners();
      return;
    }

    notifyListeners();

    // Trocar por '/home' quando a tela home estiver pronta
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}