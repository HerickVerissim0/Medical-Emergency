import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens_secundarias/angina_peito.dart';

class SistemaCardiacoScreen extends StatelessWidget {
  const SistemaCardiacoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema Cardíaco'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem no início
            Image.asset(
              'assets/images/sistemas_cardiovascular_branco.png', // Caminho da imagem
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Espaço entre a imagem e as faixas

            // Faixa Vermelha 1
            _buildRedBanner(
              context,
              "Angina de Peito",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AnginaPeitoScreen()), // Navegação para a tela Angina de Peito
                );
              },
            ),

            // Faixa Vermelha 2
            _buildRedBanner(
              context,
              "Crise Hipertensiva Arterial",
              () {
                // Navegação para a próxima tela (a ser implementada depois)
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRedBanner(
      BuildContext context, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red, // Cor da faixa
          borderRadius: BorderRadius.circular(8), // Bordas arredondadas
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const Icon(
              Icons.arrow_forward, // Ícone da seta
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
