import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const GestionEtudiantsApp());
}

class GestionEtudiantsApp extends StatelessWidget {
  const GestionEtudiantsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Étudiants',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}