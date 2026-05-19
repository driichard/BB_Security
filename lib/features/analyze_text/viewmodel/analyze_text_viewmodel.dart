import 'package:flutter/material.dart';

class AnalyzeTextViewModel extends ChangeNotifier {
  final messageController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  Future<void> analyze(BuildContext context) async {
    final message = messageController.text.trim();

    // Verifica se o campo está vazio
    if (message.isEmpty) {
      errorMessage = 'Cole ou digite uma mensagem para analisar.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Simula análise da IA — trocar pela API depois
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    // Resultado fake — trocar pela resposta real da IA depois
    final fakeResult = {
      'risk': 'alto',
      'message': message,
      'reasons': [
        'Linguagem de urgência detectada',
        'Pedido de dados sensíveis',
        'Link suspeito identificado',
      ],
    };

    Navigator.pushNamed(context, '/result', arguments: fakeResult);
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}