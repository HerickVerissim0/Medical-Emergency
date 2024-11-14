import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPageLanguage extends StatefulWidget {
  const IntroPageLanguage({super.key});

  @override
  State<IntroPageLanguage> createState() => _IntroPageLanguageState();
}

class _IntroPageLanguageState extends State<IntroPageLanguage> {
  String selectedLanguage = 'en';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language,
              size: 80,
              color: theme.brightness == Brightness.dark
                  ? const Color(0xFF1976D2)
                  : Colors.blue[700],
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              "Escolha seu idioma",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            Text(
              "Choose your language",
              style: TextStyle(
                fontSize: 16,
                color: theme.brightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
            SizedBox(height: size.height * 0.06),
            _buildLanguageOption('pt', 'Português', '🇧🇷'),
            const SizedBox(height: 16),
            _buildLanguageOption('en', 'English', '🇺🇸'),
            SizedBox(height: size.height * 0.06),
            Text(
              "Você pode alterar o idioma depois nas configurações",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: theme.brightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String code, String name, String flag) {
    final theme = Theme.of(context);
    final isSelected = selectedLanguage == code;

    return Container(
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () async {
            setState(() => selectedLanguage = code);
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('language', code);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected
                  ? (theme.brightness == Brightness.dark
                      ? const Color(0xFF1976D2).withOpacity(0.2)
                      : Colors.blue.withOpacity(0.1))
                  : Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF1976D2)
                    : theme.brightness == Brightness.dark
                        ? Colors.white30
                        : Colors.black12,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    flag,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                const Spacer(),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: theme.brightness == Brightness.dark
                        ? const Color(0xFF1976D2)
                        : Colors.blue[700],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
