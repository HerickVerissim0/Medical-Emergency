import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

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
            Text(
              "Recursos Essenciais",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            SizedBox(height: size.height * 0.05),

            // Grid de recursos
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildResourceCard(
                  context,
                  icon: Icons.phone_in_talk,
                  title: "Contatos de\nEmergência",
                  color: Colors.red,
                ),
                _buildResourceCard(
                  context,
                  icon: Icons.medical_services_outlined,
                  title: "Kit de\nEmergência",
                  color: Colors.green,
                ),
                _buildResourceCard(
                  context,
                  icon: Icons.favorite_border,
                  title: "Suporte Básico\nde Vida",
                  color: Colors.orange,
                ),
                _buildResourceCard(
                  context,
                  icon: Icons.medication_outlined,
                  title: "Medicamentos\nEssenciais",
                  color: Colors.blue,
                ),
              ],
            ),

            SizedBox(height: size.height * 0.05),

            // Texto explicativo
            Text(
              "Acesse rapidamente recursos importantes para situações de emergência",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
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

  Widget _buildResourceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.black12 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? color.withOpacity(0.3) : color.withOpacity(0.2),
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: isDark ? color.withOpacity(0.8) : color,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
