import 'package:flutter/material.dart';

class EquipamentosEmergencia extends StatelessWidget {
  const EquipamentosEmergencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipamentos de Emergência'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Equipamentos de Emergência',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
