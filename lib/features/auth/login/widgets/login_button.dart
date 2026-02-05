import 'package:flutter/material.dart';
import 'package:gigastore/core/constants/colors.dart';

class LoginButton
    extends StatelessWidget {

  final GlobalKey<FormState>
      formKey;

  const LoginButton({
    super.key,
    required this.formKey,
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
          if (formKey
              .currentState!
              .validate()) {
            Navigator
                .pushNamed(
                    context,
                    '/home');
          }
        },
        child:
            const Text("Login"),
      ),
    );
  }
}
