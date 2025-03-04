import 'package:flutter/material.dart';

class TodasEmergencias extends StatelessWidget {
  const TodasEmergencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodasEmergencias'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a TodasEmergencias',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
