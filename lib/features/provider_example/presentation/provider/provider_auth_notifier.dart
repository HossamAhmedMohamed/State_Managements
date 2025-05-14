import 'dart:developer';
import 'package:flutter/material.dart';
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

class ProviderAuthNotifier with ChangeNotifier {
  final Repository repository;
  AuthState _state = AuthState.initial();

  AuthState get state => _state;

  ProviderAuthNotifier(this.repository);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
    _state = AuthState.loading();
    notifyListeners();
    log('loading...');

    try {
      await repository.login(email, password);
      log('logiiiiiiiiin success...');
      _state = AuthState.success();
    } catch (e) {
      log('logiiiiiiiin failed...');
      _state = AuthState.error(e.toString());
    }

    notifyListeners();
  }
}
