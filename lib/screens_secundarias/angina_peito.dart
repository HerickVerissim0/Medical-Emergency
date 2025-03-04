import 'package:flutter/material.dart';

class AnginaPeitoScreen extends StatelessWidget {
  const AnginaPeitoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Angina de Peito'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf), // Ícone do PDF
            onPressed: () {
              // Ação para baixar o PDF (a ser implementada depois)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Título com formatação
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Angina de Peito',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Text(
                    '⚠️', // Ícone de alerta ou outro símbolo
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Lista de imagens e textos
            _buildImageWithText(
                'assets/images/angina1.png', 'Interrompa o atendimento.'),
            _buildImageWithText('assets/images/angina2.png',
                'Coloque o paciente em uma posição em que ele se sinta mais confortável (geralmente obtida com a cadeira odontológica semirreclinada).'),
            _buildImageWithText('assets/images/angina3.png',
                'Administre um comprimido do vasodilatador coronariano, por via sublingual: mononitrato de isossorbida 5 mg (Monocordil®), dinitrato de isossorbida 5 mg (Isordil®) ou propatilnitrato de isossorbida 10 mg (Sustrate®).'),
            _buildImageRow(
                'assets/images/angina4.png',
                'Foto 6 – Isordil Sublingual 5mg',
                'assets/images/angina5.png',
                'Administre oxigênio (3 L/min), por meio de cânula nasal ou máscara facial.'),
            _buildImageWithText('assets/images/angina6.png',
                'A dor deve cessar. Se após 5 minutos ela ainda persistir, pode-se repetir a dose do vasodilatador coronariano por duas vezes no máximo.'),
            _buildImageWithText('assets/images/angina8.png',
                'Controlada a crise, encaminhe o paciente para avaliação médica imediata, com um acompanhante adulto.'),
            _buildImageRow(
                'assets/images/angina9.png',
                'Se os sintomas ainda persistirem após essas manobras, solicite um serviço médico de urgência. Enquanto aguarda o socorro, monitorize os sinais vitais.',
                'assets/images/angina10.png',
                ''),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithText(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 100, // Ajuste o tamanho da imagem conforme necessário
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageRow(
      String imagePath1, String text1, String imagePath2, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  imagePath1,
                  width: 100, // Ajuste o tamanho da imagem conforme necessário
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(text1, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  imagePath2,
                  width: 100, // Ajuste o tamanho da imagem conforme necessário
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(text2, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
