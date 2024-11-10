import 'package:flutter/material.dart';

class KitEmergencia extends StatelessWidget {
  const KitEmergencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kit de Emergência'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Kit de Emergência',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
