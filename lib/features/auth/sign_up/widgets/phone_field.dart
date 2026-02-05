import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneField(
      {super.key,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType:
              TextInputType.phone,
          decoration:
              _dec("Phone"),
          validator: (v) =>
              v!.length < 8
                  ? "Invalid phone"
                  : null,
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
