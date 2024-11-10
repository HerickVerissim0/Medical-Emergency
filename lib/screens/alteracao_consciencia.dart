import 'package:flutter/material.dart';

class AlteracaoConsciencia extends StatelessWidget {
  const AlteracaoConsciencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alteração de Consciência'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Alteração de Consciência',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
