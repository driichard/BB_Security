import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/upload_print_viewmodel.dart';
import '../../../../core/theme/app_colors.dart';

class UploadPrintPage extends StatelessWidget {
  const UploadPrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadPrintViewModel(),
      child: const _UploadPrintView(),
    );
  }
}

class _UploadPrintView extends StatelessWidget {
  const _UploadPrintView();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UploadPrintViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text(
          'Enviar print',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
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
                        'Envie um print da mensagem suspeita. Nossa IA vai extrair o texto e analisar.',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Área de upload ou preview
              vm.imagePath == null
                  ? _buildUploadArea(context, vm)
                  : _buildImagePreview(context, vm),

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

              const Spacer(),

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
                          'Analisar print',
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

  // Área para escolher imagem (quando nenhuma foi selecionada)
  Widget _buildUploadArea(BuildContext context, UploadPrintViewModel vm) {
    return Column(
      children: [
        // Área tracejada de upload
        GestureDetector(
          onTap: () => _showImageSourceDialog(context, vm),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primaryBlue.withOpacity(0.3),
                width: 1.5,
                // ignore: deprecated_member_use
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 48,
                  color: AppColors.primaryBlue.withOpacity(0.5),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Toque para selecionar',
                  style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Câmera ou galeria',
                  style: TextStyle(
                    color: AppColors.textHint,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Botões câmera e galeria
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => vm.pickImage('camera'),
                icon: const Icon(Icons.camera_alt_outlined, size: 18),
                label: const Text('Câmera'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryBlue,
                  side: const BorderSide(color: AppColors.primaryBlue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => vm.pickImage('gallery'),
                icon: const Icon(Icons.photo_library_outlined, size: 18),
                label: const Text('Galeria'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primaryBlue,
                  side: const BorderSide(color: AppColors.primaryBlue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Preview depois que a imagem foi selecionada
  Widget _buildImagePreview(BuildContext context, UploadPrintViewModel vm) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Stack(
        children: [
          // Placeholder da imagem (trocar por Image.file depois)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.image_outlined, size: 48, color: AppColors.textHint),
                SizedBox(height: 8),
                Text(
                  'Imagem selecionada',
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                ),
              ],
            ),
          ),

          // Botão de remover imagem
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: vm.removeImage,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.highRisk,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: AppColors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog para escolher câmera ou galeria
  void _showImageSourceDialog(BuildContext context, UploadPrintViewModel vm) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Selecionar imagem',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined, color: AppColors.primaryBlue),
              title: const Text('Câmera'),
              onTap: () {
                Navigator.pop(context);
                vm.pickImage('camera');
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined, color: AppColors.primaryBlue),
              title: const Text('Galeria'),
              onTap: () {
                Navigator.pop(context);
                vm.pickImage('gallery');
              },
            ),
          ],
        ),
      ),
    );
  }
}