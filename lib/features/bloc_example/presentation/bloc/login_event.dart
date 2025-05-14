part of 'login_bloc.dart';

sealed class LoginEvent {}

final class OnLogin extends LoginEvent {
  final String email;
  final String password;

  OnLogin({required this.email, required this.password});
}
