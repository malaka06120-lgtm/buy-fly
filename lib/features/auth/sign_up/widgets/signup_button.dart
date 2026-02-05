import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class SignupButton
    extends StatelessWidget {

  final GlobalKey<FormState>
      formKey;

  const SignupButton(
      {super.key,
      required this.formKey,  });

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
            ScaffoldMessenger.of(
                    context)
                .showSnackBar(
              const SnackBar(
                  content: Text(
                      "Account created")),
            );
          }
          
        Navigator.pushReplacementNamed(
        context,
        '/login',
      );
    },
        
        child:
            const Text(
                "Sign Up"),
                
      ),
    );
  }
}
