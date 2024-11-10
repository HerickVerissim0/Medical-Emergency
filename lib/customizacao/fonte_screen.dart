import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fonte_letra.dart';

class FontSizeSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fontSizeProvider = Provider.of<FontSizeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustar Tamanho da Fonte'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Ajuste o tamanho da fonte:'),
          ),
          Slider(
            min: 10.0,
            max: 30.0,
            divisions: 20,
            value: fontSizeProvider.fontSize,
            onChanged: (newSize) {
              fontSizeProvider.setFontSize(newSize);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Exemplo de texto',
              style: TextStyle(fontSize: fontSizeProvider.fontSize),
            ),
          ),
        ],
      ),
    );
  }
}
