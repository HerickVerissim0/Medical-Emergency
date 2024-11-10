import 'package:flutter/material.dart';

class ReacaoAlergica extends StatelessWidget {
  const ReacaoAlergica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reação Alérgica'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Reação Alérgica',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
