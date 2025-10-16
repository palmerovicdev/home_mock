import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../model/entity/auth_token.dart';
import '../../model/entity/user.dart';

abstract class AuthRepository {
  Future<AuthToken> login(String email, String password);
  Future<void> logout();
  Future<AuthToken?> getStoredToken();
  Future<User?> getCurrentUser();
  Future<void> saveToken(AuthToken token);
  Future<void> saveUser(User user);
  Future<void> clearAll();
}

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage _storage;

  static const String _keyToken = 'auth_token';
  static const String _keyUserId = 'user_id';
  static const String _keyUserEmail = 'user_email';
  static const String _keyUserName = 'user_name';
  static const String _keyUserAvatar = 'user_avatar';

  AuthRepositoryImpl(this._storage);

  @override
  Future<AuthToken> login(String email, String password) async {
    // Simular delay de red
    await Future.delayed(const Duration(seconds: 2));

    // Validación mock: email debe tener @ y password >= 6 caracteres
    if (!email.contains('@') || password.length < 6) {
      throw Exception('Invalid credentials');
    }

    // Crear token mock
    final token = AuthToken(
      token: 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
      role: 'user',
      userId: 'user_${email.hashCode}',
      expiresAt: DateTime.now().add(const Duration(days: 30)),
    );

    // Guardar token
    await saveToken(token);

    // Crear y guardar usuario mock
    final user = User(
      id: token.userId,
      email: email,
      name: email.split('@').first,
      avatarUrl: 'https://i.pravatar.cc/200?u=$email',
      isLoggedIn: true,
      lastLogin: DateTime.now(),
    );

    await saveUser(user);

    return token;
  }

  @override
  Future<void> logout() async {
    await clearAll();
  }

  @override
  Future<AuthToken?> getStoredToken() async {
    try {
      final tokenStr = await _storage.read(key: _keyToken);
      if (tokenStr == null) return null;

      final tokenMap = Map<String, dynamic>.from({
        'token': tokenStr,
        'role': 'user',
        'userId': await _storage.read(key: _keyUserId) ?? '',
      });

      return AuthToken.fromJson(tokenMap);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final userId = await _storage.read(key: _keyUserId);
      if (userId == null) return null;

      return User(
        id: userId,
        email: await _storage.read(key: _keyUserEmail) ?? '',
        name: await _storage.read(key: _keyUserName) ?? '',
        avatarUrl: await _storage.read(key: _keyUserAvatar) ?? '',
        isLoggedIn: true,
        lastLogin: DateTime.now(),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveToken(AuthToken token) async {
    await _storage.write(key: _keyToken, value: token.token);
    await _storage.write(key: _keyUserId, value: token.userId);
  }

  @override
  Future<void> saveUser(User user) async {
    await _storage.write(key: _keyUserId, value: user.id);
    await _storage.write(key: _keyUserEmail, value: user.email);
    await _storage.write(key: _keyUserName, value: user.name);
    await _storage.write(key: _keyUserAvatar, value: user.avatarUrl);
  }

  @override
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
