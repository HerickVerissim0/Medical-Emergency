import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/screens/contact_us.dart';
import 'package:flutter_application_1/screens/feedback.dart';
import 'package:flutter_application_1/screens/info_app.dart';
import 'package:flutter_application_1/screens/settings_profile.dart';
import 'package:flutter_application_1/widgets/home_screen.dart';
import 'package:flutter_application_1/generated/l10n/app_localizations.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header com foto de perfil
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: theme.primaryColor.withOpacity(0.2),
                      backgroundImage: user?.photoURL != null
                          ? CachedNetworkImageProvider(user!.photoURL!)
                              as ImageProvider
                          : null,
                      child: user?.photoURL == null
                          ? Icon(
                              Icons.person,
                              size: 50,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(0xFF1976D2)
                                  : Colors.blue[700],
                            )
                          : null,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Olá, ${user?.displayName ?? 'Usuário'}',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    if (user?.email != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        user!.email!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),

              // Menu de opções
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, l10n.account),
                    _buildMenuCard(
                      context,
                      [
                        _buildListTile(
                          context,
                          icon: Icons.person_outline,
                          title: l10n.profile,
                          subtitle: l10n.editProfile,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsProfile()),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    _buildSectionTitle(context, l10n.support),
                    _buildMenuCard(
                      context,
                      [
                        _buildListTile(
                          context,
                          icon: Icons.mail_outline,
                          title: l10n.contactUs,
                          subtitle: l10n.contactUsSubtitle,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactUsScreen()),
                          ),
                        ),
                        _buildListTile(
                          context,
                          icon: Icons.star_outline,
                          title: l10n.feedback,
                          subtitle: l10n.feedbackSubtitle,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeedbackUser()),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    _buildSectionTitle(context, l10n.information),
                    _buildMenuCard(
                      context,
                      [
                        _buildListTile(
                          context,
                          icon: Icons.info_outline,
                          title: l10n.appInfo,
                          subtitle: l10n.appInfoSubtitle,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppInfoScreen()),
                          ),
                        ),
                        _buildListTile(
                          context,
                          icon: Icons.book_outlined,
                          title: l10n.references,
                          subtitle: l10n.referencesSubtitle,
                          onTap: () {
                            // Implementar navegação
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Botão de Logout
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        icon: const Icon(Icons.logout),
                        label: Text(l10n.logout),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB71C1C),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF1976D2)
                  : Colors.blue[700],
              fontWeight: FontWeight.bold,
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

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool isSignOut = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color: isSignOut
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).brightness == Brightness.dark
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
}
