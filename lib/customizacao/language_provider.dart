import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('pt');
  final List<String> supportedLanguages = ['pt', 'en'];

  Locale get currentLocale => _currentLocale;

  LanguageProvider() {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('language') ?? 'pt';
      if (supportedLanguages.contains(savedLanguage)) {
        _currentLocale = Locale(savedLanguage);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Erro ao carregar idioma: $e');
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (!supportedLanguages.contains(languageCode)) return;

    try {
      _currentLocale = Locale(languageCode);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language', languageCode);
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao mudar idioma: $e');
    }
  }
}
