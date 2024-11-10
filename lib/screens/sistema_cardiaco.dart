import 'package:flutter/material.dart';

class SistemaCardiacoScreen extends StatelessWidget {
  const SistemaCardiacoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema Cardíaco'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Medo/Ansiedade',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
