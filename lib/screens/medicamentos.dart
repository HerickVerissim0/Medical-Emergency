import 'package:flutter/material.dart';

class Medicamentos extends StatelessWidget {
  const Medicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicamentos'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Medicamentos',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
