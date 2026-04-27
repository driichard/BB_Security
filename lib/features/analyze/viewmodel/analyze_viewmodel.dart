// features/analyze/viewmodel/analyze_viewmodel.dart

import 'package:flutter/material.dart';
//import '../../auth/view/login_page.dart';
//import '../../auth/viewmodel/login_viewmodel.dart';

class AnalyzeViewModel extends ChangeNotifier {
  final textController = TextEditingController();

  void analyze() {
    final text = textController.text;

    if (text.isEmpty) {
      debugPrint("Campo vazio");
      return;
    }

    // depois você navega pra tela de resultado
    // Navigator.pushNamed(context, '/result');
  }
}