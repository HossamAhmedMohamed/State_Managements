import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managements/features/riverpod_example/data/repository/repo.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginBlocState> {
  final Repository repository;
  LoginBloc(this.repository) : super(LoginInitial()) {
    on<OnLogin>(_onLogin);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   Future<void> _onLogin(
    OnLogin event,
    Emitter<LoginBlocState> emit,
  ) async {
    emit(LoginBlocLoading());
    try {
      await repository.login(event.email, event.password);
      emit(LoginBlocSuccess());
    } catch (e) {
      emit(LoginBlocError());
    }
  }
}
