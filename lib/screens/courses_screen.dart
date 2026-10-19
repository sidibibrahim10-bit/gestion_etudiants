import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      'Développement Mobile 2',
      'Architecture Logicielle',
      'Intelligence Artificielle',
      'Sécurité des Réseaux',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Cours'), centerTitle: true),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.blue),
              title: Text(courses[index]),
              subtitle: const Text('Crédits : 4 - Semestre 2'),
            ),
          );
        },
      ),
    );
  }
}
