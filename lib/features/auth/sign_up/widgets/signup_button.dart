import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/features/auth/sign_up/cubit/signup_cubit.dart';
import '../../../../core/constants/colors.dart';

class SignupButton
    extends StatelessWidget {

  final GlobalKey<FormState>
      formKey;
    final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController confirmController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final TextEditingController addressController;
  const SignupButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passController,
    required this.confirmController,
     required this.phoneController, 
     required this.cityController, 
     required this.addressController,
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
            context.read<SignupCubit>().signup(
                  emailController.text.trim(),
                  passController.text.trim(),
                  confirmController.text.trim(),
                  phoneController.text.trim(),
                  cityController.text.trim(),
                  addressController.text.trim(),
                );
                
          }
        },
        
        child:
            const Text(
                "Sign Up"),
                
      ),
    );
  }
}
