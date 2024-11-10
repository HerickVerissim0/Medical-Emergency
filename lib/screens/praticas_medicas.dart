import 'package:flutter/material.dart';

class PraticasMedicas extends StatelessWidget {
  const PraticasMedicas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práticas médicas'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Práticas médicas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
