import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(
      String email,
      String password) async {

    if (email.isEmpty ||
        !email.contains("@")) {
      emit(LoginError("Invalid email"));
      return;
    }

    if (password.length < 6) {
      emit(LoginError(
          "Password too short"));
      return;
    }

    try {
      emit(LoginLoading());

      await Future.delayed(
          const Duration(seconds: 2));

      if (email ==
              "test@test.com" &&
          password == "123456") {
        emit(LoginSuccess());
      } else {
        emit(LoginError(
            "Wrong email or password"));
      }
    } catch (e) {
      emit(LoginError(
          "Something went wrong"));
    }
  }
}
