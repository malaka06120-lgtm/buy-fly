import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signup(
    String email,
    String password,
    String confirmPassword,
  ) async {

    /// Validation
    if (email.isEmpty ||
        !email.contains("@")) {
      emit(SignupError("Enter valid email"));
      return;
    }

    if (password.length < 6) {
      emit(SignupError(
          "Password must be at least 6 characters"));
      return;
    }

    if (password != confirmPassword) {
      emit(SignupError(
          "Passwords do not match"));
      return;
    }

    try {
      emit(SignupLoading());

      
      await Future.delayed(
          const Duration(seconds: 2));

    
      emit(SignupSuccess());

    } catch (e) {
      emit(SignupError(
          "Something went wrong"));
    }
  }
}
