import 'package:flutter/material.dart';
import 'package:flutter_application_1/customizacao/theme_provider.dart';
import 'package:provider/provider.dart';
import 'fonte_letra.dart';

class ThemeCustomizationScreen extends StatelessWidget {
  const ThemeCustomizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final fontSizeProvider = Provider.of<FontSizeProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customização de Tema',
          style: TextStyle(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color:
              theme.brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.dividerColor.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text(
                        "Modo Escuro",
                        style: TextStyle(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Altera as cores para um tema escuro",
                        style: TextStyle(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black54,
                        ),
                      ),
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                      activeColor: theme.brightness == Brightness.dark
                          ? const Color(0xFF1976D2)
                          : Colors.blue[700],
                      activeTrackColor: theme.brightness == Brightness.dark
                          ? const Color(0xFF1976D2).withOpacity(0.5)
                          : Colors.blue[700]?.withOpacity(0.5),
                    ),
                    const Divider(),
                    SwitchListTile(
                      title: Text(
                        "Alto Contraste",
                        style: TextStyle(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Aumenta o contraste para melhor visibilidade",
                        style: TextStyle(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black54,
                        ),
                      ),
                      value: themeProvider.isHighContrast,
                      onChanged: (value) {
                        themeProvider.toggleHighContrast();
                      },
                      activeColor: theme.brightness == Brightness.dark
                          ? const Color(0xFF1976D2)
                          : Colors.blue[700],
                      activeTrackColor: theme.brightness == Brightness.dark
                          ? const Color(0xFF1976D2).withOpacity(0.5)
                          : Colors.blue[700]?.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.dividerColor.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ajuste o tamanho da fonte",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.brightness == Brightness.dark
                              ? const Color(0xFF1976D2)
                              : Colors.blue[700],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "A",
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              min: 12.0,
                              max: 21.0,
                              divisions: 6,
                              label:
                                  "${fontSizeProvider.fontSize.toStringAsFixed(1)}",
                              value: fontSizeProvider.fontSize,
                              activeColor: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                              onChanged: (newSize) {
                                fontSizeProvider.setFontSize(newSize);
                              },
                            ),
                          ),
                          Text(
                            "A",
                            style: TextStyle(
                              fontSize: 28,
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Exemplo de texto com o tamanho atual',
                        style: TextStyle(
                          fontSize: fontSizeProvider.fontSize,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
