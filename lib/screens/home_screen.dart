import 'package:flutter/material.dart';

import 'profile_screen.dart';
import 'courses_screen.dart';
import 'grades_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de bord'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Déconnexion',
            onPressed: () {
              // Retour à l'écran de connexion
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message de bienvenue
            const Text(
              'Bonjour, Aïssata',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bienvenue sur votre application de gestion des étudiants.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Indicateurs visuels (Statistiques / Cartes rapides)
            const Text(
              'Indicateurs clés',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Utilisation d'un Wrap pour éviter tout débordement horizontal
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: [
                _buildIndicatorCard(
                  context,
                  title: 'Cours',
                  value: '4',
                  icon: Icons.book,
                  color: Colors.blue,
                ),
                _buildIndicatorCard(
                  context,
                  title: 'Notes',
                  value: '15/20',
                  icon: Icons.grade,
                  color: Colors.orange,
                ),
                _buildIndicatorCard(
                  context,
                  title: 'Notifications',
                  value: '2',
                  icon: Icons.notifications,
                  color: Colors.red,
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Text(
              'Navigation principale',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Boutons de navigation vers les autres écrans du TP
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.blue),
                title: const Text('Mes Cours'),
                subtitle: const Text('Voir la liste dynamique des cours'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoursesScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.grade, color: Colors.orange),
                title: const Text('Mes Notes'),
                subtitle: const Text('Consulter vos notes et appréciations'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GradesScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.green),
                title: const Text('Mon Profil'),
                subtitle: const Text('Informations personnelles et filière'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget personnalisé pour les cartes d'indicateurs visuels
  Widget _buildIndicatorCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    // Calcul de la largeur pour que les cartes s'adaptent bien à l'écran
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth > 600) ? 170 : (screenWidth - 48) / 2;

    return SizedBox(
      width: cardWidth,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
