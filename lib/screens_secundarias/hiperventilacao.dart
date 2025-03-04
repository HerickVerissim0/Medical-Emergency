import 'package:flutter/material.dart';

class HiperventilacaoScreen extends StatelessWidget {
  const HiperventilacaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hiperventilação'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado à Hiperventilação',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
