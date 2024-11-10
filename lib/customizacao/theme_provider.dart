import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool _isHighContrast = false;

  bool get isDarkMode => _isDarkMode;
  bool get isHighContrast => _isHighContrast;

  ThemeData get themeData {
    // Cores base
    final Color backgroundColor =
        _isDarkMode ? const Color(0xFF121212) : Colors.white;
    final Color textColor = _isDarkMode ? Colors.white : Colors.black;

    // Cores principais
    final Color primaryLightColor = const Color(0xFF1976D2); // Azul claro
    final Color primaryDarkColor =
        const Color(0xFF1976D2); // Mesmo azul no modo escuro (não roxo)
    final Color highContrastColor =
        const Color(0xFF0D47A1); // Azul mais escuro para alto contraste

    final Color primaryColor =
        _isDarkMode ? primaryDarkColor : primaryLightColor;

    if (_isHighContrast) {
      return ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: highContrastColor,
        cardColor: backgroundColor,
        dividerColor: highContrastColor,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: textColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
        ),
        iconTheme: IconThemeData(
          color: highContrastColor,
          size: 24,
        ),
        cardTheme: CardTheme(
          elevation: 8,
          color: _isDarkMode
              ? highContrastColor
                  .withOpacity(0.2) // Fundo azul escuro transparente
              : highContrastColor
                  .withOpacity(0.1), // Fundo azul claro transparente
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: highContrastColor,
              width: 2.5,
            ),
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return highContrastColor;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return highContrastColor.withOpacity(0.5);
            }
            return null;
          }),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: highContrastColor,
          thumbColor: highContrastColor,
          inactiveTrackColor: highContrastColor.withOpacity(0.3),
        ),
      );
    }

    // Tema normal (claro/escuro)
    return ThemeData(
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: backgroundColor,
      dividerColor: primaryColor.withOpacity(0.5),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: textColor,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
        size: 24,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: primaryColor.withOpacity(0.3),
            width: 1.0,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: textColor,
        ),
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleHighContrast() {
    _isHighContrast = !_isHighContrast;
    notifyListeners();
  }
}
