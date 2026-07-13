import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigastore/core/constants/colors.dart';
import 'package:gigastore/data/repositories/auth_repo.dart';
import 'package:gigastore/features/auth/login/cubit/login_cubit.dart';
import 'package:gigastore/features/auth/login/cubit/login_state.dart';

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
    return BlocProvider(
  create: (context) => LoginCubit(AuthRepo()),
  child: Scaffold(
      backgroundColor:
          AppColors.white,
      body: Padding(
        padding:
            const EdgeInsets.all(20),
        child:
            SingleChildScrollView(
              child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, "/home");
                }

                if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
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
                  formKey: _formKey,
                  emailController: emailController,
                  passController: passController,
                ),


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
    )));
  }
}
