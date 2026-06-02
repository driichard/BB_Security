import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String risk = args['risk'];
    final String message = args['message'];
    final List<String> reasons = List<String>.from(args['reasons']);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'Resultado da análise',
          style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRiskCard(risk),
              const SizedBox(height: 20),

              _buildSection(
                title: 'Mensagem analisada',
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

               if (risk != 'baixo') ...[
                _buildSection(
                  title: 'Motivos identificados',
                  child: Column(
                    children: reasons.map((reason) => _buildReasonItem(reason)).toList(),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              _buildTip(risk),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Voltar para o início',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/analyze-text'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primaryBlue,
                    side: const BorderSide(color: AppColors.primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Analisar outra mensagem',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRiskCard(String risk) {
    late Color bgColor;
    late Color textColor;
    late Color iconBg;
    late IconData icon;
    late String title;
    late String subtitle;

    switch (risk) {
      case 'alto':
        bgColor = const Color(0xFFFDEDED);
        textColor = AppColors.highRisk;
        iconBg = AppColors.highRisk;
        icon = Icons.warning_amber_rounded;
        title = 'Alto risco — Possível golpe!';
        subtitle = 'Esta mensagem tem características de fraude.';
        break;
      case 'medio':
        bgColor = const Color(0xFFFFF3E0);
        textColor = AppColors.mediumRisk;
        iconBg = AppColors.mediumRisk;
        icon = Icons.info_outline;
        title = 'Médio risco — Atenção!';
        subtitle = 'Esta mensagem tem alguns pontos suspeitos.';
        break;
      default:
        bgColor = const Color(0xFFE8F5E9);
        textColor = AppColors.lowRisk;
        iconBg = AppColors.lowRisk;
        icon = Icons.check_circle_outline;
        title = 'Baixo risco — Mensagem segura';
        subtitle = 'Não identificamos sinais de golpe.';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: textColor.withOpacity(0.8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget _buildReasonItem(String reason) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          const Icon(Icons.cancel_outlined, color: AppColors.highRisk, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              reason,
              style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTip(String risk) {
    final isHigh = risk == 'alto' || risk == 'medio';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline, color: AppColors.primaryBlue, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              isHigh
                  ? 'Não clique em links, não forneça dados pessoais e não faça transferências. Em caso de dúvida, entre em contato com o Banco do Brasil.'
                  : 'Mesmo mensagens seguras podem conter erros. Fique sempre atento antes de clicar em links ou fornecer dados.',
              style: const TextStyle(
                color: AppColors.primaryBlue,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}