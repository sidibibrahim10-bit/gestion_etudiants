import 'package:flutter/material.dart';

import '../models/etudiant.dart';

class AddEtudiantScreen extends StatefulWidget {
  final Etudiant? etudiantAModifier; // Paramètre optionnel pour l'édition

  const AddEtudiantScreen({super.key, this.etudiantAModifier});

  @override
  State<AddEtudiantScreen> createState() => _AddEtudiantScreenState();
}

class _AddEtudiantScreenState extends State<AddEtudiantScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _filiereController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Si on modifie, on pré-remplit les champs avec les données existantes
    _nomController = TextEditingController(
      text: widget.etudiantAModifier?.nom ?? '',
    );
    _prenomController = TextEditingController(
      text: widget.etudiantAModifier?.prenom ?? '',
    );
    _filiereController = TextEditingController(
      text: widget.etudiantAModifier?.filiere ?? '',
    );
    _emailController = TextEditingController(
      text: widget.etudiantAModifier?.email ?? '',
    );
  }

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
      final etudiantResultat = Etudiant(
        // On garde l'ancien ID si on modifie, sinon on en génère un nouveau
        id:
            widget.etudiantAModifier?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        nom: _nomController.text,
        prenom: _prenomController.text,
        filiere: _filiereController.text,
        email: _emailController.text,
      );

      Navigator.pop(context, etudiantResultat);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool estModeModification = widget.etudiantAModifier != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          estModeModification ? 'Modifier l\'Étudiant' : 'Ajouter un Étudiant',
        ),
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
                  child: Text(
                    estModeModification
                        ? 'Mettre à jour'
                        : 'Enregistrer l\'étudiant',
                    style: const TextStyle(fontSize: 18),
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
