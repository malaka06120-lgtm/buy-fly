import 'package:flutter/material.dart';
import 'package:gigastore/core/constants/colors.dart';

import 'widgets/login_email_field.dart';
import 'widgets/login_password_field.dart';
import 'widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final _formKey =
      GlobalKey<FormState>();

  final emailController =
      TextEditingController();
  final passController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.white,
      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child:
            SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [

                const SizedBox(
                    height: 80),

                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                        color: AppColors.black
                  ),
                ),

                const SizedBox(
                    height: 40),

                LoginEmailField(
                    controller:
                        emailController),

                LoginPasswordField(
                    controller:
                        passController),

                const SizedBox(
                    height: 10),

                Align(
                  alignment:
                      Alignment
                          .centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator
                          .pushNamed(
                              context,
                              '/forgot');
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: AppColors
                              .primary),
                    ),
                  ),
                ),

                const SizedBox(
                    height: 10),

                LoginButton(
                    formKey:
                        _formKey),

                const SizedBox(
                    height: 15),

                Center( 
                  child: TextButton(
                     onPressed: () { 
                      Navigator .pushNamed( context, '/signup');
                       }, 
                       child: const Text( "Create Account",
                        style: TextStyle( color: AppColors .primary,
                         fontSize: 16, fontWeight: FontWeight .w500, 
                         ),
                          ), 
                          ),
                           ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
