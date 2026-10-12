import 'package:flutter/material.dart';

import '../models/etudiant.dart';

class AddEtudiantScreen extends StatefulWidget {
  const AddEtudiantScreen({super.key});

  @override
  State<AddEtudiantScreen> createState() => _AddEtudiantScreenState();
}

class _AddEtudiantScreenState extends State<AddEtudiantScreen> {
  final _formKey = GlobalKey<FormState>();

  // Contrôleurs pour les champs du formulaire
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _filiereController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _filiereController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      // Création de l'objet Etudiant
      final nouveauEtudiant = Etudiant(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nom: _nomController.text,
        prenom: _prenomController.text,
        filiere: _filiereController.text,
        email: _emailController.text,
      );

      // On retourne l'étudiant créé à l'écran précédent
      Navigator.pop(context, nouveauEtudiant);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un Étudiant'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez entrer le nom'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez entrer le prénom'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _filiereController,
                decoration: const InputDecoration(
                  labelText: 'Filière',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.school),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez entrer la filière'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Veuillez entrer l\'email'
                    : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Enregistrer l\'étudiant',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
