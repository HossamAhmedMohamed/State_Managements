import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? token;
  final String? error;

  AuthState({required this.status, this.token, this.error});

  factory AuthState.initial() => AuthState(status: AuthStatus.initial);
  factory AuthState.loading() => AuthState(status: AuthStatus.loading);
  factory AuthState.success() => AuthState(status: AuthStatus.success);
  factory AuthState.error(String message) =>
      AuthState(status: AuthStatus.error, error: message);
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Repository repository;

  AuthNotifier(this.repository) : super(AuthState.initial());

  Future<void> login(String email, String password) async {
    state = AuthState.loading();
    log('loading...');
    try {
      await repository.login(email, password);
      log('login success...');
      state = AuthState.success();
    } catch (e) {
      log('login failed...');
      state = AuthState.error(e.toString());
    }
  }
}
