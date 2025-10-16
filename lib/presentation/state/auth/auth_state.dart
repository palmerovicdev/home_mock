import 'package:equatable/equatable.dart';

import '../../../model/entity/auth_status.dart';
import '../../../model/entity/auth_token.dart';
import '../../../model/entity/user.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthToken? token;
  final User? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.token,
    this.user,
    this.errorMessage,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;

  bool get isUnauthenticated => status == AuthStatus.unauthenticated;

  bool get isChecking => status == AuthStatus.checking;

  bool get hasError => status == AuthStatus.error;

  bool get hasFailed => status == AuthStatus.failed;

  @override
  List<Object?> get props => [status, token, user, errorMessage];

  AuthState copyWith({
    AuthStatus? status,
    AuthToken? token,
    User? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      user: user ?? this.user,
      errorMessage: errorMessage,
    );
  }

  AuthState clearError() {
    return AuthState(
      status: AuthStatus.unauthenticated,
      token: token,
      user: user,
      errorMessage: null,
    );
  }
}
