import 'package:flutter/material.dart';
import 'termos_politica.dart'; // Importe a nova tela
import 'package:flutter_application_1/generated/l10n/app_localizations.dart'; // Importando as localizações

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget _buildInfoSection(String title, List<Map<String, String>> items) {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: theme.dividerColor.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.brightness == Brightness.dark
                      ? const Color(0xFF1976D2)
                      : Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...items.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          item['icon'] == 'email'
                              ? Icons.email
                              : item['icon'] == 'web'
                                  ? Icons.language
                                  : Icons.info,
                          color: theme.brightness == Brightness.dark
                              ? const Color(0xFF1976D2)
                              : Colors.blue[700],
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${item['label']}: ${item['value']}',
                            style: TextStyle(
                              color: theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!
              .appInfoTitle, // Usando string localizada
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.info_outline,
                        size: 48,
                        color: theme.brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Medical Emergency',
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!
                          .version, // Usando string localizada
                      style: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white70
                            : Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoSection(
                      AppLocalizations.of(context)!
                          .aboutApp, // Usando string localizada
                      [
                        {
                          'icon': 'info',
                          'label': AppLocalizations.of(context)!
                              .description, // Usando string localizada
                          'value': AppLocalizations.of(context)!
                              .description // Usando string localizada
                        },
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection(
                      AppLocalizations.of(context)!
                          .contactInfo, // Usando string localizada
                      [
                        {
                          'icon': 'email',
                          'label': AppLocalizations.of(context)!
                              .email, // Usando string localizada
                          'value': 'herickverissimo9@gmail.com'
                        },
                        {
                          'icon': 'web',
                          'label': AppLocalizations.of(context)!
                              .website, // Usando string localizada
                          'value': 'www.medicalemergency.com'
                        },
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection(
                      AppLocalizations.of(context)!
                          .developers, // Usando string localizada
                      [
                        {
                          'icon': 'info',
                          'label': AppLocalizations.of(context)!
                              .team, // Usando string localizada
                          'value': 'Herick e Roberta'
                        },
                        {
                          'icon': 'info',
                          'label': AppLocalizations.of(context)!
                              .technologies, // Usando string localizada
                          'value': 'Flutter e Firebase'
                        },
                      ],
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.description,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            title: Text(
                              AppLocalizations.of(context)!
                                  .termsOfUse, // Usando string localizada
                              style: TextStyle(
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermsPolicyScreen(
                                    title: AppLocalizations.of(context)!
                                        .termsOfUse, // Usando string localizada
                                    content: AppLocalizations.of(context)!
                                        .termsOfUseContent, // Usando string localizada
                                  ),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.privacy_tip,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            title: Text(AppLocalizations.of(context)!
                                .privacyPolicy), // Usando string localizada
                            trailing: Icon(
                              Icons.chevron_right,
                              color: theme.brightness == Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TermsPolicyScreen(
                                    title: AppLocalizations.of(context)!
                                        .privacyPolicy, // Usando string localizada
                                    content: AppLocalizations.of(context)!
                                        .privacyPolicyContent, // Usando string localizada
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
