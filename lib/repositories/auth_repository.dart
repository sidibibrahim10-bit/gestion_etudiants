import '../services/auth_service.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<bool> authenticate(String email, String password) async {
    return await _authService.login(email, password);
  }
}
