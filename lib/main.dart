import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login_screen.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:provider/provider.dart';
import 'customizacao/fonte_letra.dart';
import 'customizacao/theme_provider.dart';
import 'widgets/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialização do Firebase para Web, Android e outras plataformas
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCfYknYMG87TqELzqOqcEuelGcWHZjKRvc",
        authDomain: "applicationlogin-5a202.firebaseapp.com",
        projectId: "applicationlogin-5a202",
        storageBucket: "applicationlogin-5a202.appspot.com",
        messagingSenderId: "857702111209",
        appId: "1:857702111209:web:8c58eebd0c04b583455d78",
      ),
    );
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDjEDqb74ec8LnN4UOqHnTW339tY9zsHcM",
        appId: "1:857702111209:android:107379347248cb33455d78",
        messagingSenderId: "857702111209",
        projectId: "applicationlogin-5a202",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FontSizeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, FontSizeProvider>(
      builder: (context, themeProvider, fontSizeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData.copyWith(
            textTheme: Theme.of(context).textTheme.apply(
                  fontSizeFactor: fontSizeProvider.fontSize / 16.0,
                ),
          ),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/onboarding': (context) => const OnboardingController(),
            '/home': (context) => const HomeScreen(),
          },
          home: const LoginScreen(), // Sempre começa com a tela de login
        );
      },
    );
  }
}
