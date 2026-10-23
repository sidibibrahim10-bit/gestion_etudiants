import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Données simulées des notes des étudiants avec les guillemets corrigés
    final List<Map<String, dynamic>> grades = [
      {
        'course': 'Développement mobile avancé',
        'grade': '16.5 / 20',
        'coefficient': 4,
        'appreciation': 'Très bien',
      },
      {
        'course': 'Génie logiciel',
        'grade': '14.0 / 20',
        'coefficient': 3,
        'appreciation': 'Bien',
      },
      {
        'course': 'Intelligence Artificielle',
        'grade': '15.0 / 20',
        'coefficient': 4,
        'appreciation': 'Bien',
      },
      {
        'course': 'Sécurité des Réseaux',
        'grade': '13.5 / 20',
        'coefficient': 3,
        'appreciation': 'Assez bien',
      },
      {
        'course': 'Bases de données avancées',
        'grade': '17.0 / 20',
        'coefficient': 4,
        'appreciation': 'Très bien',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mes Notes'), centerTitle: true),
      body: grades.isEmpty
          ? const Center(
              child: Text(
                'Aucune note disponible pour le moment.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: grades.length,
              itemBuilder: (context, index) {
                final item = grades[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: const Icon(Icons.grade, color: Colors.orange),
                    ),
                    title: Text(
                      item['course'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Appréciation : ${item['appreciation']} (Coef : ${item['coefficient']})',
                    ),
                    trailing: Text(
                      item['grade'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
