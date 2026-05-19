import 'package:flutter/material.dart';

class UploadPrintViewModel extends ChangeNotifier {
  // Guarda o caminho da imagem escolhida
  String? imagePath;
  bool isLoading = false;
  String? errorMessage;

  // Simula a escolha de imagem — trocar pelo image_picker depois
  void pickImage(String source) {
    // Por enquanto só simula que uma imagem foi selecionada
    // Quando integrar: usar image_picker para abrir câmera ou galeria
    imagePath = 'imagem_selecionada';
    errorMessage = null;
    notifyListeners();
  }

  // Remove a imagem selecionada
  void removeImage() {
    imagePath = null;
    notifyListeners();
  }

  Future<void> analyze(BuildContext context) async {
    // Verifica se tem imagem selecionada
    if (imagePath == null) {
      errorMessage = 'Selecione uma imagem para analisar.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Simula OCR + análise da IA — trocar pela API depois
    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    // Resultado fake — trocar pela resposta real da IA depois
    final fakeResult = {
      'risk': 'alto',
      'message': 'Texto extraído da imagem: URGENTE! Sua conta foi bloqueada. Clique no link para desbloquear.',
      'reasons': [
        'Linguagem de urgência detectada',
        'Link suspeito identificado',
        'Pedido de ação imediata',
      ],
    };

    Navigator.pushNamed(context, '/result', arguments: fakeResult);
  }
}