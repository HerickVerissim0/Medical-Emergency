import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens_secundarias/sincope_lipotimia.dart'; // Importar a nova tela
import 'package:flutter_application_1/screens_secundarias/hipotensao_ortostatica.dart'; // Importar a nova tela
import 'package:flutter_application_1/screens_secundarias/hipoglicemia.dart'; // Importar a nova tela

class AlteracaoConsciencia extends StatelessWidget {
  const AlteracaoConsciencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alteração de Consciência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem no início
            Image.asset(
              'assets/images/alteracao_conscienia_branco.png', // Caminho da nova imagem
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Espaço entre a imagem e as faixas

            // Faixa Vermelha 1
            _buildRedBanner(
              context,
              "Síncope Lipotimia",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SincopeLipotimiaScreen()), // Navegação para a tela Síncope Lipotimia
                );
              },
            ),

            // Faixa Vermelha 2
            _buildRedBanner(
              context,
              "Hipotensão Ortostática",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HipotensaoOrtostaticaScreen()), // Navegação para a tela Hipotensão Ortostática
                );
              },
            ),

            // Faixa Vermelha 3
            _buildRedBanner(
              context,
              "Hipoglicemia",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const HipoglicemiaScreen()), // Navegação para a tela Hipoglicemia
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
