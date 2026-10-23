import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Données simulées d'au moins cinq cours demandées par le TP[cite: 5]
    final List<Map<String, dynamic>> courses = [
      {
        'code': 'MOB301',
        'title': 'Développement mobile avancé',
        'teacher': 'Mme Traoré',
        'credits': 4,
      },
      {
        'code': 'GEN302',
        'title': 'Génie logiciel',
        'teacher': 'M. Diallo',
        'credits': 3,
      },
      {
        'code': 'AI303',
        'title': 'Intelligence Artificielle',
        'teacher': 'Dr DJIBO Kadidiatou',
        'credits': 4,
      },
      {
        'code': 'SEC304',
        'title': 'Sécurité des Réseaux',
        'teacher': 'M. Koné',
        'credits': 3,
      },
      {
        'code': 'BD305',
        'title': 'Bases de données avancées',
        'teacher': 'Mme Cissé',
        'credits': 4,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Liste des cours'), centerTitle: true),
      body: courses.isEmpty
          ? const Center(
              // Gestion du cas où la liste est vide (consigne du TP)[cite: 5]
              child: Text(
                'Aucun cours disponible pour le moment.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: const Icon(Icons.book, color: Colors.blue),
                    ),
                    title: Text(
                      course['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Code : ${course['code']} | Enseignant : ${course['teacher']}',
                    ),
                    trailing: Text(
                      '${course['credits']} crédits',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    onTap: () {
                      // Action : Voir les détails ou notes du cours[cite: 5]
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Détails du cours : ${course['title']}',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
