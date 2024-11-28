import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/auth_service.dart';

import '../controller/onboarding_controller.dart';
import '../widgets/custom_textfield.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header com gradiente
            Container(
              height: size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.brightness == Brightness.dark
                        ? const Color(0xFF1976D2)
                        : Colors.blue[700]!,
                    theme.brightness == Brightness.dark
                        ? const Color(0xFF1976D2).withOpacity(0.8)
                        : Colors.blue[500]!,
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medical_services_rounded,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Medical Emergency",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Formulário
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    "Cadastro",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: theme.brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Campos de texto com sombra suave
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: "Digite seu nome",
                          label: "Nome",
                          controller: _name,
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hint: "Digite seu email",
                          label: "Email",
                          controller: _email,
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          hint: "Digite sua senha",
                          label: "Senha",
                          isPassword: true,
                          controller: _password,
                          prefixIcon: Icons.lock,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Botão de Cadastro
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.brightness == Brightness.dark
                            ? const Color(0xFF1976D2)
                            : Colors.blue[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "CADASTRAR",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Link para Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Já tem uma conta? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black54,
                        ),
                      ),
                      InkWell(
                        onTap: () => goToLogin(context),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: theme.brightness == Brightness.dark
                                ? const Color(0xFF1976D2)
                                : Colors.blue[700],
                          ),
                        ),
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

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  // Altere aqui para navegar para a tela de introdução
  goToOnboarding(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const OnboardingController()), // Navegar para a tela de introdução
      );

  _signup() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      log("User Created Succesfully");
      goToOnboarding(context);
    }
  }
}
