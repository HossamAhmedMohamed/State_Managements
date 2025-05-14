import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class GetXAuthController extends GetxController {
  final Repository repository;

  GetXAuthController(this.repository);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final Rx<AuthState> _state = AuthState.initial().obs;
  AuthState get state => _state.value;

  Future<void> login(String email, String password) async {
    _state.value = AuthState.loading();
    log('loading...');

    try {
      await repository.login(email, password);
      log('logiiiiiiiiin success...');
      _state.value = AuthState.success();
    } catch (e) {
      log('logiiiiiiiin failed...');
      _state.value = AuthState.error(e.toString());
    }
  }
}