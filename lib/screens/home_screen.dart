import 'package:flutter/material.dart';

import '../models/etudiant.dart';
import 'add_etudiant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Liste complète des étudiants
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
    Etudiant(
      id: '3',
      nom: 'Traore',
      prenom: 'Ibrahim',
      filiere: 'Intelligence Artificielle',
      email: 'ibrahim.traore@email.com',
    ),
  ];

  // Liste filtrée pour la recherche
  List<Etudiant> _filteredEtudiants = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredEtudiants = _etudiants;
    _searchController.addListener(_filterEtudiants);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Fonction de recherche en temps réel
  void _filterEtudiants() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEtudiants = _etudiants.where((etudiant) {
        final fullName = '${etudiant.prenom} ${etudiant.nom}'.toLowerCase();
        final filiere = etudiant.filiere.toLowerCase();
        return fullName.contains(query) || filiere.contains(query);
      }).toList();
    });
  }

  // Navigation vers l'écran d'ajout
  void _navigateToAddScreen() async {
    final Etudiant? nouvelEtudiant = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddEtudiantScreen()),
    );

    if (nouvelEtudiant != null) {
      setState(() {
        _etudiants.add(nouvelEtudiant);
        _filterEtudiants(); // Mettre à jour le filtre
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Étudiant ajouté avec succès !'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  // Suppression d'un étudiant avec confirmation
  void _supprimerEtudiant(Etudiant etudiant) {
    setState(() {
      _etudiants.remove(etudiant);
      _filterEtudiants();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${etudiant.prenom} ${etudiant.nom} supprimé'),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            setState(() {
              _etudiants.add(etudiant);
              _filterEtudiants();
            });
          },
        ),
      ),
    );
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
            tooltip: 'Se déconnecter',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // En-tête Statistiques & Recherche
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade50,
            child: Column(
              children: [
                // Carte Statistiques rapide
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard(
                      'Total Étudiants',
                      '${_etudiants.length}',
                      Icons.group,
                      Colors.blue,
                    ),
                    _buildStatCard(
                      'Filières Actives',
                      '3',
                      Icons.school,
                      Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Barre de recherche
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher par nom ou filière...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Liste des étudiants
          Expanded(
            child: _filteredEtudiants.isEmpty
                ? const Center(
                    child: Text(
                      'Aucun étudiant trouvé.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredEtudiants.length,
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      final etudiant = _filteredEtudiants[index];
                      return Dismissible(
                        key: Key(etudiant.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) =>
                            _supprimerEtudiant(etudiant),
                        child: Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${etudiant.filiere}\n${etudiant.email}',
                            ),
                            isThreeLine: true,
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              onPressed: () => _supprimerEtudiant(etudiant),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddScreen,
        icon: const Icon(Icons.add),
        label: const Text('Ajouter'),
      ),
    );
  }

  // Widget personnalisé pour les cartes de statistiques
  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
