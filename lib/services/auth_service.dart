class AuthService {
  // Simule un appel réseau ou une base de données pour l'authentification
  Future<bool> login(String email, String password) async {
    await Future.delayed(
      const Duration(seconds: 1),
    ); // Simulation de délai réseau
    // Pour le test, on accepte n'importe quel email/password non vide
    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    }
    return false;
  }
}
