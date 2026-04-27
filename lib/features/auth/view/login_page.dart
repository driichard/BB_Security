// features/auth/view/login_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO / NOME
            Text(
              'BB Security',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Proteção contra golpes digitais',
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 40),

            // EMAIL
            TextField(
              controller: vm.emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'E-mail ou CPF',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // SENHA
            TextField(
              controller: vm.passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // BOTÃO LOGIN
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: vm.isLoading
                    ? null
                    : () => vm.login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: vm.isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),

            const SizedBox(height: 16),

            // BIOMETRIA (simulação)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // depois você navega pra tela de recuperação
                  // Navigator.pushNamed(context, '/forgot-password');
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    color: AppColors.primary, 
                    fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
