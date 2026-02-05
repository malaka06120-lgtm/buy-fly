import 'package:flutter/material.dart';
import 'package:gigastore/core/constants/colors.dart';

class LoginPasswordField
    extends StatefulWidget {

  final TextEditingController
      controller;

  const LoginPasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<LoginPasswordField>
      createState() =>
          _LoginPasswordFieldState();
}

class _LoginPasswordFieldState
    extends State<LoginPasswordField> {

  bool obscure = true;

  @override
  Widget build(
      BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller:
              widget.controller,
          obscureText: obscure,
          decoration: _dec(),
          validator: (v) {
            if (v!.isEmpty) {
              return "Password required";
            }
            if (v.length < 6) {
              return "Min 6 chars";
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  InputDecoration _dec() {
    return InputDecoration(
      hintText: "Password",
      filled: true,
      fillColor:
          AppColors.lightGray,
      border:
          OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(
                12),
        borderSide:
            BorderSide.none,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          obscure
              ? Icons.visibility
              : Icons
                  .visibility_off,
        ),
        onPressed: () {
          setState(() {
            obscure = !obscure;
          });
        },
      ),
    );
  }
}
