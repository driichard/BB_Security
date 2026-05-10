import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool acceptedTerms = false;
  String? errorMessage;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void toggleTerms() {
    acceptedTerms = !acceptedTerms;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final cpf = cpfController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // Verifica campos vazios
    if (name.isEmpty || email.isEmpty || cpf.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      errorMessage = 'Preencha todos os campos.';
      notifyListeners();
      return;
    }

    // Verifica se as senhas coincidem
    if (password != confirmPassword) {
      errorMessage = 'As senhas não coincidem.';
      notifyListeners();
      return;
    }

    // Verifica se aceitou os termos
    if (!acceptedTerms) {
      errorMessage = 'Aceite os termos para continuar.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Simula cadastro — trocar pelo banco de dados depois
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    notifyListeners();

    // Vai para o login após cadastro
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    cpfController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}