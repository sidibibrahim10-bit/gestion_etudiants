import 'package:flutter/foundation.dart';
import 'package:gestion_etudiants/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success = await _authRepository.authenticate(email, password);
      if (!success) {
        _errorMessage = 'Identifiants incorrects';
      }
      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Une erreur est survenue : $e';
      notifyListeners();
      return false;
    }
  }
}
