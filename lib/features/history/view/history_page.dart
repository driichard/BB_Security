import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Filtro selecionado
  String selectedFilter = 'Todos';

  // Lista fake de análises — trocar pelo banco de dados depois
  final List<Map<String, dynamic>> allAnalyses = [
    {
      'message': 'Você ganhou um prêmio! Clique aqui para resgatar.',
      'risk': 'alto',
      'date': 'Hoje, 10:32',
    },
    {
      'message': 'Seu boleto está disponível para pagamento.',
      'risk': 'baixo',
      'date': 'Hoje, 09:15',
    },
    {
      'message': 'URGENTE: Sua conta será bloqueada em 24 horas.',
      'risk': 'alto',
      'date': 'Ontem, 15:40',
    },
    {
      'message': 'Confirme seu cadastro clicando no link abaixo.',
      'risk': 'medio',
      'date': 'Ontem, 12:05',
    },
    {
      'message': 'Sua fatura do cartão está disponível.',
      'risk': 'baixo',
      'date': '15/05, 08:30',
    },
    {
      'message': 'Parabéns! Você foi selecionado para um empréstimo.',
      'risk': 'alto',
      'date': '14/05, 17:20',
    },
  ];

  // Retorna só as análises do filtro selecionado
  List<Map<String, dynamic>> get filteredAnalyses {
    if (selectedFilter == 'Todos') return allAnalyses;
    if (selectedFilter == 'Alto') return allAnalyses.where((a) => a['risk'] == 'alto').toList();
    if (selectedFilter == 'Médio') return allAnalyses.where((a) => a['risk'] == 'medio').toList();
    if (selectedFilter == 'Seguro') return allAnalyses.where((a) => a['risk'] == 'baixo').toList();
    return allAnalyses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Histórico',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filtros
            _buildFilters(),

            // Lista de análises
            Expanded(
              child: filteredAnalyses.isEmpty
                  ? _buildEmpty()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredAnalyses.length,
                      itemBuilder: (context, index) {
                        return _buildHistoryItem(filteredAnalyses[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.textHint,
        backgroundColor: AppColors.white,
        elevation: 8,
        onTap: (index) {
          if (index == 0) Navigator.pushReplacementNamed(context, '/home');
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

  // Abas de filtro
  Widget _buildFilters() {
    final filters = ['Todos', 'Alto', 'Médio', 'Seguro'];

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return GestureDetector(
            onTap: () => setState(() => selectedFilter = filter),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryBlue : AppColors.background,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.primaryBlue : AppColors.divider,
                ),
              ),
              child: Text(
                filter,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Card de cada análise
  Widget _buildHistoryItem(Map<String, dynamic> item) {
    // Define cor e texto do badge de risco
    Color riskColor;
    Color riskBg;
    String riskLabel;

    if (item['risk'] == 'alto') {
      riskColor = AppColors.highRisk;
      riskBg = const Color(0xFFFDEDED);
      riskLabel = 'Alto risco';
    } else if (item['risk'] == 'medio') {
      riskColor = AppColors.mediumRisk;
      riskBg = const Color(0xFFFFF3E0);
      riskLabel = 'Médio';
    } else {
      riskColor = AppColors.lowRisk;
      riskBg = const Color(0xFFE8F5E9);
      riskLabel = 'Seguro';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          // Ícone de risco
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: riskBg,
              shape: BoxShape.circle,
            ),
            child: Icon(
              item['risk'] == 'baixo'
                  ? Icons.check_circle_outline
                  : Icons.warning_amber_rounded,
              color: riskColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),

          // Mensagem e data
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['message'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['date'],
                  style: const TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Badge de risco
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
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tela quando não tem análises no filtro
  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.history_outlined, size: 48, color: AppColors.textHint),
          SizedBox(height: 12),
          Text(
            'Nenhuma análise encontrada',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
          ),
        ],
      ),
    );
  }
}