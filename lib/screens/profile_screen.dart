import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Données simulées du profil étudiant[cite: 7]
    final student = {
      'name': 'Aïssata Diallo',
      'studentId': 'ETU20260142',
      'major': 'Génie Logiciel',
      'level': 'Licence 3 (L3)',
      'email': 'aissata.diallo@etudiant.edu',
      'phone': '+223 70 00 00 00',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Profil étudiant'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Bloc Avatar et Nom
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              student['name']!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              student['level']!,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Bloc Informations académiques et personnelles
            _buildSectionTitle('Informations académiques'),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.badge, color: Colors.blue),
                    title: const Text('Matricule'),
                    subtitle: Text(student['studentId']!),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.school, color: Colors.blue),
                    title: const Text('Filière'),
                    subtitle: Text(student['major']!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildSectionTitle('Coordonnées'),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.orange),
                    title: const Text('Adresse e-mail'),
                    subtitle: Text(student['email']!),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.orange),
                    title: const Text('Téléphone'),
                    subtitle: Text(student['phone']!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget utilitaire pour les titres de sections
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
