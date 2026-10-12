import 'package:flutter/material.dart';

import '../models/etudiant.dart';
import 'add_etudiant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Liste mutable d'étudiants (sans 'const' devant les objets)
  final List<Etudiant> _etudiants = [
    Etudiant(
      id: '1',
      nom: 'Diallo',
      prenom: 'Mamadou',
      filiere: 'Génie Logiciel',
      email: 'mamadou.diallo@email.com',
    ),
    Etudiant(
      id: '2',
      nom: 'Kone',
      prenom: 'Aissatou',
      filiere: 'Systèmes et Réseaux',
      email: 'aissatou.kone@email.com',
    ),
  ];

  void _navigateToAddScreen() async {
    final Etudiant? nouvelEtudiant = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEtudiantScreen()),
    );

    if (nouvelEtudiant != null) {
      setState(() {
        _etudiants.add(nouvelEtudiant);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Étudiant ajouté avec succès !')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Étudiants'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: _etudiants.isEmpty
          ? const Center(child: Text('Aucun étudiant enregistré.'))
          : ListView.builder(
              itemCount: _etudiants.length,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (context, index) {
                final etudiant = _etudiants[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text(
                        etudiant.prenom[0],
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      '${etudiant.prenom} ${etudiant.nom}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${etudiant.filiere}\n${etudiant.email}'),
                    isThreeLine: true,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
