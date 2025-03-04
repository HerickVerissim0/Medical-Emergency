import 'package:flutter/material.dart';

class HipoglicemiaScreen extends StatelessWidget {
  const HipoglicemiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hipoglicemia'),
      ),
      body: const Center(
        child: Text(
          'Conteúdo relacionado a Hipoglicemia',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
