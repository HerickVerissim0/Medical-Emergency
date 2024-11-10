import 'package:flutter/material.dart';

class ContatosEmergencia extends StatelessWidget {
  const ContatosEmergencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medo/Ansiedade'),
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
