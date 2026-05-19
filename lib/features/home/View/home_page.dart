import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.primaryYellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shield_outlined,
                size: 18,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'BB Security',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            icon: const Icon(Icons.settings_outlined, color: AppColors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saudação
              _buildGreeting(),
              const SizedBox(height: 24),

              // Card de alerta rápido
              _buildAlertBanner(),
              const SizedBox(height: 28),

              // Título seção
              const Text(
                'O que você quer analisar?',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              // Cards principais
              _buildActionCard(
                context,
                icon: Icons.chat_bubble_outline,
                title: 'Analisar mensagem',
                subtitle: 'Cole um texto suspeito para análise',
                color: AppColors.primaryBlue,
                route: '/analyze-text',
              ),
              const SizedBox(height: 12),
              _buildActionCard(
                context,
                icon: Icons.image_outlined,
                title: 'Enviar print',
                subtitle: 'Envie uma imagem de mensagem suspeita',
                color: AppColors.lightBlue,
                route: '/upload-print',
              ),
              const SizedBox(height: 28),

              // Histórico
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Análises recentes',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/history'),
                    child: const Text(
                      'Ver todas',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Lista fake de análises recentes
              _buildHistoryItem(
                message: 'Você ganhou um prêmio! Clique aqui...',
                risk: 'alto',
                date: 'Hoje, 10:32',
              ),
              const SizedBox(height: 8),
              _buildHistoryItem(
                message: 'Seu boleto está disponível para pagamento',
                risk: 'baixo',
                date: 'Ontem, 15:14',
              ),
              const SizedBox(height: 8),
              _buildHistoryItem(
                message: 'URGENTE: Sua conta será bloqueada...',
                risk: 'alto',
                date: 'Ontem, 09:05',
              ),
            ],
          ),
        ),
      ),

      // Barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textHint,
        backgroundColor: AppColors.white,
        elevation: 8,
        onTap: (index) {
          if (index == 1) Navigator.pushNamed(context, '/history');
          if (index == 2) Navigator.pushNamed(context, '/settings');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Config.',
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Olá! 👋',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Recebeu algo suspeito? Vamos analisar.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildAlertBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFE082)),
      ),
      child: Row(
        children: const [
          Icon(Icons.info_outline, color: Color(0xFFF57C00), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Fique atento! Golpes digitais estão cada vez mais sofisticados.',
              style: TextStyle(
                color: Color(0xFF5D4037),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required String route,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem({
    required String message,
    required String risk,
    required String date,
  }) {
    final isHigh = risk == 'alto';
    final riskColor = isHigh ? AppColors.highRisk : AppColors.lowRisk;
    final riskBg = isHigh ? const Color(0xFFFDEDED) : const Color(0xFFE8F5E9);
    final riskLabel = isHigh ? 'Alto risco' : 'Seguro';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: riskBg,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              riskLabel,
              style: TextStyle(
                color: riskColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}