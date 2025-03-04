import 'package:flutter/material.dart';

class SincopeLipotimiaScreen extends StatelessWidget {
  const SincopeLipotimiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Síncope Lipotimia'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Síncope Lipotimia',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
