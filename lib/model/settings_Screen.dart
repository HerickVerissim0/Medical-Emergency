import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n/app_localizations.dart';
import 'package:flutter_application_1/screens/app_guide_screen.dart';
import 'package:flutter_application_1/screens/notification.dart';
import 'package:flutter_application_1/customizacao/theme_customization.dart';
import 'package:flutter_application_1/widgets/home_screen.dart';
import 'package:provider/provider.dart';
import '../customizacao/language_provider.dart';

class Settings_Screen extends StatelessWidget {
  const Settings_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

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
                          ? const Color(0xFF1976D2)
                          : Colors.blue[700],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.settings,
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      l10n.customization,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
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
                        title: l10n.screenCustomization,
                        subtitle: l10n.themes,
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
                      l10n.notifications,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
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
                        title: l10n.notificationSettings,
                        subtitle: l10n.manageAlerts,
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
                      l10n.help,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
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
                        title: l10n.appGuide,
                        subtitle: l10n.howToUse,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppGuideScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      l10n.languageSection,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildMenuCard(
                    context,
                    [
                      Consumer<LanguageProvider>(
                        builder: (context, languageProvider, child) {
                          return _buildListTile(
                            context,
                            icon: Icons.language,
                            title: l10n.selectLanguage,
                            subtitle:
                                languageProvider.currentLocale.languageCode ==
                                        'pt'
                                    ? "Português"
                                    : "English",
                            onTap: () => _showLanguageBottomSheet(
                                context, languageProvider),
                          );
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
            ? const Color(0xFF1976D2)
            : Colors.blue[700],
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1976D2)
            : Colors.blue[700],
      ),
      onTap: onTap,
    );
  }

  void _showLanguageBottomSheet(
      BuildContext context, LanguageProvider languageProvider) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final l10n = AppLocalizations.of(context)!;
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.chooseLanguage,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              _buildLanguageOption(
                context,
                title: "Português",
                subtitle: "Portuguese",
                flag: "🇧🇷",
                isSelected: languageProvider.currentLocale.languageCode == 'pt',
                onTap: () {
                  languageProvider.changeLanguage('pt');
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              _buildLanguageOption(
                context,
                title: "English",
                subtitle: "Inglês",
                flag: "🇺🇸",
                isSelected: languageProvider.currentLocale.languageCode == 'en',
                onTap: () {
                  languageProvider.changeLanguage('en');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Text(
        flag,
        style: const TextStyle(fontSize: 24),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
            )
          : null,
      onTap: onTap,
    );
  }
}
