import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPageLanguage extends StatefulWidget {
  const IntroPageLanguage({super.key});

  @override
  State<IntroPageLanguage> createState() => _IntroPageLanguageState();
}

class _IntroPageLanguageState extends State<IntroPageLanguage> {
  String selectedLanguage = 'en'; // Padrão inglês

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.language,
            size: 100,
            color: Color(0xFF1976D2),
          ),
          const SizedBox(height: 32),
          Text(
            "Choose your language",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(height: 48),
          _buildLanguageOption('en', 'English', '🇺🇸'),
          const SizedBox(height: 16),
          _buildLanguageOption('pt', 'Português', '🇧🇷'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String code, String name, String flag) {
    final isSelected = selectedLanguage == code;

    return GestureDetector(
      onTap: () async {
        setState(() => selectedLanguage = code);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('language', code);
        // Aqui você chamaria sua função para mudar o idioma
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1976D2) : Colors.transparent,
          border: Border.all(
            color: isSelected ? const Color(0xFF1976D2) : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : null,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
