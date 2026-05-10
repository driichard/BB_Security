import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/register_viewmodel.dart';
import '../../../../core/theme/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RegisterViewModel>();

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              _buildHeader(context),
              const SizedBox(height: 32),
              _buildFormCard(context, vm),
              const SizedBox(height: 24),
              _buildLoginLink(context),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white, size: 20),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Criar conta',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'BB Security',
              style: TextStyle(
                color: AppColors.primaryYellow,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormCard(BuildContext context, RegisterViewModel vm) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Nome
          _buildLabel('Nome completo'),
          const SizedBox(height: 6),
          TextField(
            controller: vm.nameController,
            onChanged: (_) => vm.clearError(),
            decoration: _inputDecoration(hint: 'Seu nome', icon: Icons.person_outline),
          ),
          const SizedBox(height: 16),

          // Email
          _buildLabel('E-mail'),
          const SizedBox(height: 6),
          TextField(
            controller: vm.emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) => vm.clearError(),
            decoration: _inputDecoration(hint: 'seu@email.com', icon: Icons.email_outlined),
          ),
          const SizedBox(height: 16),

          // CPF
          _buildLabel('CPF'),
          const SizedBox(height: 6),
          TextField(
            controller: vm.cpfController,
            keyboardType: TextInputType.number,
            onChanged: (_) => vm.clearError(),
            decoration: _inputDecoration(hint: '000.000.000-00', icon: Icons.badge_outlined),
          ),
          const SizedBox(height: 16),

          // Senha
          _buildLabel('Senha'),
          const SizedBox(height: 6),
          TextField(
            controller: vm.passwordController,
            obscureText: vm.obscurePassword,
            onChanged: (_) => vm.clearError(),
            decoration: _inputDecoration(
              hint: '••••••••',
              icon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(
                  vm.obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                onPressed: vm.togglePasswordVisibility,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Confirmar senha
          _buildLabel('Confirmar senha'),
          const SizedBox(height: 6),
          TextField(
            controller: vm.confirmPasswordController,
            obscureText: vm.obscureConfirmPassword,
            onChanged: (_) => vm.clearError(),
            decoration: _inputDecoration(
              hint: '••••••••',
              icon: Icons.lock_outline,
              suffixIcon: IconButton(
                icon: Icon(
                  vm.obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                onPressed: vm.toggleConfirmPasswordVisibility,
              ),
            ),
          ),

          // Erro
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

          // Termos
          Row(
            children: [
              Checkbox(
                value: vm.acceptedTerms,
                onChanged: (_) => vm.toggleTerms(),
                activeColor: AppColors.primaryBlue,
              ),
              const Expanded(
                child: Text(
                  'Aceito os termos de uso e política de privacidade (LGPD)',
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Botão cadastrar
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: vm.isLoading ? null : () => vm.register(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryYellow,
                foregroundColor: AppColors.primaryBlue,
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
                        color: AppColors.primaryBlue,
                      ),
                    )
                  : const Text(
                      'Criar conta',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
      prefixIcon: Icon(icon, color: AppColors.textSecondary, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.background,
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Já tem conta? ',
          style: TextStyle(color: Colors.white60, fontSize: 14),
        ),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          child: const Text(
            'Fazer login',
            style: TextStyle(
              color: AppColors.primaryYellow,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}