import 'package:flutter/material.dart';
import 'termos_politica.dart'; // Importe a nova tela

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
                            size: 20),
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
          'Informações do App',
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
                      'Versão 1.0.0',
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
                      'Sobre o Aplicativo',
                      [
                        {
                          'icon': 'info',
                          'label': 'Descrição',
                          'value':
                              'Um aplicativo para auxiliar em situações de emergência médica'
                        },
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection(
                      'Informações de Contato',
                      [
                        {
                          'icon': 'email',
                          'label': 'E-mail',
                          'value': 'herickverissimo9@gmail.com'
                        },
                        {
                          'icon': 'web',
                          'label': 'Site',
                          'value': 'www.medicalemergency.com'
                        },
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection(
                      'Desenvolvedores',
                      [
                        {
                          'icon': 'info',
                          'label': 'Equipe',
                          'value': 'Herick e Roberta'
                        },
                        {
                          'icon': 'info',
                          'label': 'Tecnologias',
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
                              'Termos de Uso',
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
                                  builder: (context) => const TermsPolicyScreen(
                                    title: 'Termos de Uso',
                                    content: '''
Termos de Uso do Medical Emergency

Este documento estabelece os termos e condições para o uso do aplicativo:

1. Aceitação dos Termos
   Ao utilizar este aplicativo, você concorda automaticamente com estes termos de uso.

2. Uso do Aplicativo
   Este aplicativo destina-se apenas para fins informativos e não substitui uma consulta médica profissional.

3. Responsabilidades
   Não nos responsabilizamos por decisões tomadas com base nas informações fornecidas pelo aplicativo.

4. Privacidade
   Respeitamos sua privacidade de acordo com nossa política de privacidade.

5. Modificações
   Reservamos o direito de modificar estes termos a qualquer momento, sem aviso prévio.
''',
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
                            title: const Text('Política de Privacidade'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TermsPolicyScreen(
                                    title: 'Política de Privacidade',
                                    content: '''
Política de Privacidade do Medical Emergency

Este documento explica como tratamos suas informações:

1. Coleta de Dados
   Coletamos apenas os dados estritamente necessários para o funcionamento do aplicativo.

2. Uso dos Dados
   Suas informações são utilizadas exclusivamente para melhorar sua experiência no app.

3. Proteção de Dados
   Implementamos medidas de segurança robustas para proteger seus dados pessoais.

4. Compartilhamento
   Não compartilhamos suas informações com terceiros sem seu consentimento expresso.

5. Seus Direitos
   Você tem total direito de acessar, corrigir ou solicitar a exclusão de seus dados.
''',
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
