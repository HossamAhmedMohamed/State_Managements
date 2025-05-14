part of 'login_bloc.dart';

sealed class LoginBlocState {}

final class LoginInitial extends LoginBlocState {}

final class LoginBlocLoading extends LoginBlocState {}

final class LoginBlocSuccess extends LoginBlocState {}

final class LoginBlocError extends LoginBlocState {}
