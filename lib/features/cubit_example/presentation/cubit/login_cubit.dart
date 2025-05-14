import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repository) : super(LoginInitial());

  final Repository repository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      await repository.login(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError());
    }
  }
}
