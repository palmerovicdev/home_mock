import '../data/repository/auth_repository.dart';
import '../model/entity/auth_token.dart';
import '../model/entity/user.dart';

abstract class AuthService {
  Future<AuthToken> login(String email, String password);

  Future<void> logout();

  Future<AuthToken?> checkSession();

  Future<User?> getCurrentUser();
}

class AuthServiceImpl implements AuthService {
  final AuthRepository _repository;

  AuthServiceImpl(this._repository);

  @override
  Future<AuthToken> login(String email, String password) async {
    return await _repository.login(email, password);
  }

  @override
  Future<void> logout() async {
    await _repository.logout();
  }

  @override
  Future<AuthToken?> checkSession() async {
    final token = await _repository.getStoredToken();
    if (token == null || !token.isValid) {
      await _repository.clearAll();
      return null;
    }
    return token;
  }

  @override
  Future<User?> getCurrentUser() async {
    return await _repository.getCurrentUser();
  }
}
