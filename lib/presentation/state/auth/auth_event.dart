abstract class AuthEvent {}

class AuthCheckSession extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin(this.email, this.password);
}

class AuthLogout extends AuthEvent {}

class AuthClearError extends AuthEvent {}
