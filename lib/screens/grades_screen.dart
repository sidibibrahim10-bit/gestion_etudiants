import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grades = [
      {'course': 'Développement Mobile 2', 'note': '16/20'},
      {'course': 'Architecture Logicielle', 'note': '14.5/20'},
      {'course': 'Intelligence Artificielle', 'note': '15/20'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Notes'), centerTitle: true),
      body: ListView.builder(
        itemCount: grades.length,
        itemBuilder: (context, index) {
          final g = grades[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.grade, color: Colors.orange),
              title: Text(g['course']!),
              trailing: Text(
                g['note']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
