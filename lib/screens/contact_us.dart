import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _messageController = TextEditingController();

    _emailController.text = user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Entre em Contato',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header com ícone e texto explicativo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.contact_support_outlined,
                    size: 48,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF1976D2)
                        : Colors.blue[700],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Como podemos ajudar?',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Nossa equipe responderá em até 24 horas',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // Formulário
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email field
                  Text(
                    'Seu e-mail',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    readOnly: true,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white10
                          : Theme.of(context).cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Message field
                  Text(
                    'Sua mensagem',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _messageController,
                    maxLines: 5,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white10
                          : Theme.of(context).cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Digite sua mensagem aqui...',
                      hintStyle: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white38
                            : Colors.black38,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Send button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        final String email = _emailController.text;
                        final String message = _messageController.text;

                        if (message.isNotEmpty) {
                          try {
                            await sendEmail(email, message);
                            if (context.mounted) {
                              // Limpa o campo de mensagem após envio bem-sucedido
                              _messageController.clear();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Mensagem enviada com sucesso!'),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Erro ao enviar mensagem. Tente novamente.'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.error,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Por favor, digite uma mensagem.'),
                              backgroundColor:
                                  Theme.of(context).colorScheme.error,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFF1976D2)
                                : Colors.blue[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Enviar Mensagem'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendEmail(String email, String message) async {
    final String username = 'herickverissimo9@gmail.com';
    final String password = 'wycv dmdu bltl tvun'; // Sua senha de app do Gmail

    final smtpServer = gmail(username, password);

    final emailMessage = Message()
      ..from = Address(username, 'Medical Emergency App')
      ..recipients.add('herickverissimo9@gmail.com')
      ..subject = 'Contato via App - $email'
      ..text = '''
Mensagem de: $email

$message

Enviado via Medical Emergency App
''';

    try {
      final sendReport = await send(emailMessage, smtpServer);
      print('Mensagem enviada: ${sendReport.toString()}');
    } catch (e) {
      print('Erro ao enviar e-mail: $e');
      rethrow; // Isso permitirá que você trate o erro na UI
    }
  }
}
