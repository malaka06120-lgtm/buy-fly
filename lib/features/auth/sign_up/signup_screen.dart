import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/data/repositories/auth_repo.dart';
import 'package:gigastore/features/auth/sign_up/cubit/signup_cubit.dart';
import 'package:gigastore/features/auth/sign_up/cubit/signup_state.dart';
import '../../../core/constants/colors.dart';
import 'widgets/email_field.dart';
import 'widgets/phone_field.dart';
import 'widgets/address_fields.dart';
import 'widgets/password_fields.dart';
import 'widgets/signup_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() =>
      _SignUpScreenState();
}

class _SignUpScreenState
    extends State<SignUpScreen> {

  final _formKey =
      GlobalKey<FormState>();

  final email = TextEditingController();
  final phone = TextEditingController();
  final city = TextEditingController();
  final address =
      TextEditingController();
  final pass = TextEditingController();
  final confirm =
      TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SignupCubit(AuthRepo()),
    child:Scaffold(
      backgroundColor:
          AppColors.white,
      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child:
            SingleChildScrollView(
          child: BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {

              if (state is SignupSuccess) {
                Navigator.pushReplacementNamed(context, "/home");
              }

              if (state is SignupError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(
                    height: 60),

                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                        color: AppColors.black
                  ),
                ),

                const SizedBox(
                    height: 30),

                EmailField(
                    controller:
                        email),

                PhoneField(
                    controller:
                        phone),

                AddressFields(
                  cityController:
                      city,
                  addressController:
                      address,
                ),

                PasswordFields(
                  passController:
                      pass,
                  confirmController:
                      confirm,
                ),

                const SizedBox(
                    height: 20),

                SignupButton(
                  formKey: _formKey,
                  emailController: email,
                  passController: pass,
                  confirmController: confirm, 
                  phoneController: phone, 
                  cityController: city, 
                  addressController: address,
                )

              ],
            ),
          ),
        ),
      ),
    )));
  }
}
