import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../viewmodel/analyze_viewmodel.dart';

class AnalyzePage extends StatelessWidget {
  const AnalyzePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AnalyzeViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          // 🔥 CORREÇÃO DO OVERFLOW (SCROLL)
          child: SingleChildScrollView(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "BB Security",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.shield, color: AppColors.primary),
                  ],
                ),

                const SizedBox(height: 30),

                // TÍTULO
                const Text(
                  "ANALISAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Nossa IA buscará por phishing, fraudes e links suspeitos. "
                  "Cole o conteúdo abaixo para iniciar a análise profunda.",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 30),

                // INPUT
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    controller: vm.textController,
                    maxLines: null,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Cole a mensagem aqui...",
                      hintStyle: TextStyle(color: Colors.white38),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // BOTÃO PRINT
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.image, size: 18),
                    label: const Text("ENVIAR PRINT"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // BOTÃO PRINCIPAL
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: vm.analyze,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondary,
                            AppColors.primary,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Analisar Agora",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // LINHA
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.white24)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "INTELIGÊNCIA PROFUNDA ATIVA",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 10,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.white24)),
                  ],
                ),

                const SizedBox(height: 20),

                // CARD
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Defesa Proativa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "O SafeRadar cruza ameaças em 24 bancos de dados "
                        "de segurança globais em tempo real.",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("1.2M+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text("PRECISÃO",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 10)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("99.9%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text("PRECISÃO",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 10)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      // 🔥 NAVBAR
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, "Início", false),
            _navItem(Icons.history, "Histórico", false),
            _navItem(Icons.search, "Analisar", true),
            _navItem(Icons.settings, "Ajustes", false),
          ],
        ),
      ),
    );
  }

  // NAV ITEM
  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active ? AppColors.primary : Colors.white38,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: active ? AppColors.primary : Colors.white38,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}