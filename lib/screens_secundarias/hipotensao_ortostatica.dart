import 'package:flutter/material.dart';

class HipotensaoOrtostaticaScreen extends StatelessWidget {
  const HipotensaoOrtostaticaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hipotensão Ortostática'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Hipotensão Ortostática',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
