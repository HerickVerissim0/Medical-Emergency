import 'package:flutter/material.dart';

class CriseAsmaScreen extends StatelessWidget {
  const CriseAsmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crise Aguda de Asma'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado à Crise Aguda de Asma',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}