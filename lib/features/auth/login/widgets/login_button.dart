import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/core/constants/colors.dart';
import 'package:gigastore/features/auth/login/cubit/login_cubit.dart';

class LoginButton
    extends StatelessWidget {

  final GlobalKey<FormState>
      formKey;

  final TextEditingController emailController;
  final TextEditingController passController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passController,
  });

  @override
  Widget build(
      BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style:
            ElevatedButton
                .styleFrom(
          backgroundColor:
              AppColors.primary,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<LoginCubit>().login(
                  emailController.text.trim(),
                  passController.text.trim(),
                );
          }
        },
        child:
            const Text("Login"),
      ),
    );
  }
}
