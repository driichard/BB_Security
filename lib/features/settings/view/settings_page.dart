import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Configurações — trocar pelo banco de dados depois
  bool localProcessing = true;
  bool sendAnonymousData = false;
  bool notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Configurações',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Seção privacidade
              _buildSectionTitle('Privacidade'),
              const SizedBox(height: 10),
              _buildToggleItem(
                icon: Icons.phone_android_outlined,
                title: 'Processamento local',
                subtitle: 'Analisa mensagens no próprio dispositivo',
                value: localProcessing,
                onChanged: (value) => setState(() => localProcessing = value),
              ),
              const SizedBox(height: 8),
              _buildToggleItem(
                icon: Icons.cloud_upload_outlined,
                title: 'Enviar dados anônimos',
                subtitle: 'Ajuda a melhorar a detecção de golpes',
                value: sendAnonymousData,
                onChanged: (value) => setState(() => sendAnonymousData = value),
              ),
              const SizedBox(height: 24),

              // Seção notificações
              _buildSectionTitle('Notificações'),
              const SizedBox(height: 10),
              _buildToggleItem(
                icon: Icons.notifications_outlined,
                title: 'Alertas de golpe',
                subtitle: 'Receba notificações de ameaças detectadas',
                value: notifications,
                onChanged: (value) => setState(() => notifications = value),
              ),
              const SizedBox(height: 24),

              // Seção sobre
              _buildSectionTitle('Sobre'),
              const SizedBox(height: 10),
              _buildLinkItem(
                icon: Icons.description_outlined,
                title: 'Política de Privacidade (LGPD)',
                onTap: () {
                  // TODO: abrir política de privacidade
                },
              ),
              const SizedBox(height: 8),
              _buildLinkItem(
                icon: Icons.info_outline,
                title: 'Termos de uso',
                onTap: () {
                  // TODO: abrir termos de uso
                },
              ),
              const SizedBox(height: 8),
              _buildLinkItem(
                icon: Icons.shield_outlined,
                title: 'Versão do app',
                subtitle: '1.0.0',
                onTap: null,
              ),
              const SizedBox(height: 24),

              // Botão excluir dados
              _buildDangerButton(
                title: 'Excluir meus dados',
                onTap: () => _showDeleteDialog(context),
              ),
              const SizedBox(height: 12),

              // Botão sair
              _buildDangerButton(
                title: 'Sair da conta',
                onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textHint,
        backgroundColor: AppColors.white,
        elevation: 8,
        onTap: (index) {
          if (index == 0) Navigator.pushReplacementNamed(context, '/home');
          if (index == 1) Navigator.pushReplacementNamed(context, '/history');
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

  // Título de cada seção
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.primaryBlue,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }

  // Item com toggle (ligar/desligar)
  Widget _buildToggleItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryBlue, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryBlue,
          ),
        ],
      ),
    );
  }

  // Item com link (abre página ou mostra info)
  Widget _buildLinkItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textHint,
                  fontSize: 13,
                ),
              )
            else if (onTap != null)
              const Icon(Icons.arrow_forward_ios, color: AppColors.textHint, size: 14),
          ],
        ),
      ),
    );
  }

  // Botão de ação perigosa (excluir ou sair)
  Widget _buildDangerButton({
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isLogout ? AppColors.background : const Color(0xFFFDEDED),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isLogout ? AppColors.divider : AppColors.highRisk.withOpacity(0.3),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isLogout ? AppColors.textSecondary : AppColors.highRisk,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // Dialog de confirmação para excluir dados
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Excluir meus dados'),
        content: const Text(
          'Tem certeza? Todos os seus dados e histórico serão apagados permanentemente.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: chamar API para excluir dados
            },
            child: const Text(
              'Excluir',
              style: TextStyle(color: AppColors.highRisk),
            ),
          ),
        ],
      ),
    );
  }
}