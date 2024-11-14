import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

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
              "Procedimentos de Emergência",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),

            SizedBox(height: size.height * 0.05),

            // Cards dos procedimentos
            _buildProcedureCard(
              context,
              icon: Icons.favorite,
              title: "Sistema Cardíaco",
              description: "Aprenda sobre PCR e outros procedimentos cardíacos",
            ),

            const SizedBox(height: 16),

            _buildProcedureCard(
              context,
              icon: Icons.air,
              title: "Sistema Respiratório",
              description: "Técnicas de ventilação e desobstrução",
            ),

            const SizedBox(height: 16),

            _buildProcedureCard(
              context,
              icon: Icons.medical_services,
              title: "Reação Alérgica",
              description: "Protocolos para anafilaxia e alergias graves",
            ),

            const SizedBox(height: 16),

            _buildProcedureCard(
              context,
              icon: Icons.psychology,
              title: "Alteração da Consciência",
              description: "Manejo de pacientes inconscientes",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProcedureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? Colors.black12
            : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? const Color(0xFF1976D2).withOpacity(0.3)
              : Colors.blue.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? const Color(0xFF1976D2).withOpacity(0.2)
                  : Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 28,
              color: theme.brightness == Brightness.dark
                  ? const Color(0xFF1976D2)
                  : Colors.blue[700],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
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
        ],
      ),
    );
  }
}
