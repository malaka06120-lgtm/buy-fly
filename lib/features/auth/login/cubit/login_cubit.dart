import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/data/models/auth_model.dart';
import 'package:gigastore/data/repositories/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    /// Validation
    if (email.isEmpty || !email.contains("@")) {
      emit(LoginError("Enter valid email"));
      return;
    }

    if (password.length < 6) {
      emit(LoginError("Password must be at least 6 characters"));
      return;
    }

    try {
      emit(LoginLoading());

      await authRepo.login(
        model: AuthModel(
          email: email,
          password: password,
        ),
      );

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError("Wrong email or password"));
    }
  }
}
