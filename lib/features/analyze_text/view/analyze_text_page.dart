import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/analyze_text_viewmodel.dart';
import '../../../../core/theme/app_colors.dart';

class AnalyzeTextPage extends StatelessWidget {
  const AnalyzeTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnalyzeTextViewModel(),
      child: const _AnalyzeTextView(),
    );
  }
}

class _AnalyzeTextView extends StatelessWidget {
  const _AnalyzeTextView();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AnalyzeTextViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'Analisar mensagem',
          style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instrução
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: AppColors.primaryBlue, size: 18),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Cole abaixo a mensagem que você recebeu e suspeita ser um golpe.',
                        style: TextStyle(color: AppColors.primaryBlue, fontSize: 13, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Campo de texto
              const Text(
                'Mensagem suspeita',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: TextField(
                  controller: vm.messageController,
                  onChanged: (_) => vm.clearError(),
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: 'Cole aqui a mensagem suspeita...',
                    hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              // Mensagem de erro
              if (vm.errorMessage != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDEDED),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.highRisk, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          vm.errorMessage!,
                          style: const TextStyle(color: AppColors.highRisk, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // Botão analisar
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: vm.isLoading ? null : () => vm.analyze(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: vm.isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColors.white,
                          ),
                        )
                      : const Text(
                          'Analisar',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}