import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/notification.dart';
import 'package:flutter_application_1/customizacao/theme_customization.dart';
import 'package:flutter_application_1/widgets/home_screen.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(24),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 40,
          toolbarHeight: 24,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20,
              ),
              icon: Icon(
                Icons.arrow_back,
                size: 24,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header com ícone
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: ListTile(
                title: Column(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 80,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(
                              0xFF1976D2) // Azul escuro no modo escuro
                          : Colors.blue[700], // Azul escuro no modo claro
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Configurações',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu de opções
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Personalização',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(
                                0xFF1976D2) // Azul escuro no modo escuro
                            : Colors.blue[700], // Azul escuro no modo claro
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildMenuCard(
                    context,
                    [
                      _buildListTile(
                        context,
                        icon: Icons.palette,
                        title: "Customização de Tela",
                        subtitle: "Temas, cores e fontes",
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ThemeCustomizationScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    title: Text(
                      'Notificações',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(
                                0xFF1976D2) // Azul escuro no modo escuro
                            : Colors.blue[700], // Azul escuro no modo claro
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildMenuCard(
                    context,
                    [
                      _buildListTile(
                        context,
                        icon: Icons.notifications,
                        title: "Notificações e Ajustes Rápidos",
                        subtitle: "Gerenciar alertas e sons",
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    title: Text(
                      'Ajuda',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(
                                0xFF1976D2) // Azul escuro no modo escuro
                            : Colors.blue[700], // Azul escuro no modo claro
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildMenuCard(
                    context,
                    [
                      _buildListTile(
                        context,
                        icon: Icons.info,
                        title: "Guia do Aplicativo",
                        subtitle: "Como usar o app",
                        onTap: () {
                          // Implementar navegação
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1976D2) // Azul escuro no modo escuro
            : Colors.blue[700], // Azul escuro no modo claro
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1976D2) // Azul escuro no modo escuro
            : Colors.blue[700], // Azul escuro no modo claro
      ),
      onTap: onTap,
    );
  }
}
