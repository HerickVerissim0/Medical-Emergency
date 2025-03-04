import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens_secundarias/hiperventilacao.dart'; // Importar a nova tela
import 'package:flutter_application_1/screens_secundarias/crise_asma.dart'; // Importar a nova tela

class SistemaRespiratorioScreen extends StatelessWidget {
  const SistemaRespiratorioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema Respiratório'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem no início
            Image.asset(
              'assets/images/sistema_respiratorio_branco.png', // Caminho da nova imagem
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Espaço entre a imagem e as faixas

            // Faixa Vermelha 1
            _buildRedBanner(
              context,
              "Hiperventilação",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HiperventilacaoScreen()), // Navegação para a tela Hiperventilação
                );
              },
            ),

            // Faixa Vermelha 2
            _buildRedBanner(
              context,
              "Crise Aguda de Asma",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CriseAsmaScreen()), // Navegação para a tela Crise Aguda de Asma
                );
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
