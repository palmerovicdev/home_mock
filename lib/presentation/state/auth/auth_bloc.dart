import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../model/entity/auth_status.dart';
import '../../../service/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(const AuthState()) {
    on<AuthCheckSession>(_onCheckSession);
    on<AuthLogin>(_onLogin);
    on<AuthLogout>(_onLogout);
    on<AuthClearError>(_onClearError);
  }

  Future<void> _onCheckSession(
    AuthCheckSession event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.checking));

    try {

      await Future.delayed(const Duration(milliseconds: 1500));

      final token = await _authService.checkSession();

      if (token != null && token.isValid) {
        final user = await _authService.getCurrentUser();
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            token: token,
            user: user,
          ),
        );
      } else {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.checking));

    try {
      final token = await _authService.login(event.email, event.password);
      final user = await _authService.getCurrentUser();

      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          token: token,
          user: user,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.checking));

    try {
      await _authService.logout();
      emit(const AuthState(status: AuthStatus.unauthenticated));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onClearError(
    AuthClearError event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.clearError());
  }
}
