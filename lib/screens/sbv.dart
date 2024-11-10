import 'package:flutter/material.dart';

class Sbv extends StatelessWidget {
  const Sbv({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SBV'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a SBV',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
