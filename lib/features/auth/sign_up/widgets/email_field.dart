import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField(
      {super.key,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration:
              _dec("Email"),
          validator: (v) {
            if (v!.isEmpty) {
              return "Email required";
            }
            if (!v.contains("@")) {
              return "Invalid email";
            }
            return null;
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  InputDecoration _dec(
      String h) {
    return InputDecoration(
      hintText: h,
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
    );
  }
}
