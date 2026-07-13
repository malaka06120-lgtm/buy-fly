import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/data/models/auth_model.dart';
import 'package:gigastore/data/repositories/auth_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;

  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signup(
    String email,
    String password,
    String confirmPassword, 
    String phone,
    String city,
    String address, 
  ) async {
    /// Validation
    if (email.isEmpty || !email.contains("@")) {
      emit(SignupError("Enter valid email"));
      return;
    }

    if (password.length < 6) {
      emit(SignupError("Password must be at least 6 characters"));
      return;
    }

    if (password != confirmPassword) {
      emit(SignupError("Passwords do not match"));
      return;
    }

    try {
    emit(SignupLoading());

    await authRepo.register(
      model: AuthModel(email: email, password: password),
      phone: phone,
      city: city,
      address: address,
    );

    emit(SignupSuccess());
  } catch (e) {
    emit(SignupError(e.toString()));
  }
  }
}
