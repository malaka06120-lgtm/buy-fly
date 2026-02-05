import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class PasswordFields
    extends StatefulWidget {

  final TextEditingController
      passController;
  final TextEditingController
      confirmController;

  const PasswordFields({
    super.key,
    required this.passController,
    required this.confirmController,
  });

  @override
  State<PasswordFields>
      createState() =>
          _PasswordFieldsState();
}

class _PasswordFieldsState
    extends State<PasswordFields> {

  bool o1 = true;
  bool o2 = true;

  @override
  Widget build(
      BuildContext context) {
    return Column(
      children: [

        TextFormField(
          controller:
              widget
                  .passController,
          obscureText: o1,
          decoration:
              _dec("Password", o1,
                  () {
            setState(() =>
                o1 = !o1);
          }),
          validator: (v) =>
              v!.length < 6
                  ? "Min 6 chars"
                  : null,
        ),

        const SizedBox(
            height: 15),

        TextFormField(
          controller:
              widget
                  .confirmController,
          obscureText: o2,
          decoration:
              _dec("Confirm", o2,
                  () {
            setState(() =>
                o2 = !o2);
          }),
          validator: (v) =>
              v !=
                      widget
                          .passController
                          .text
                  ? "Not match"
                  : null,
        ),
      ],
    );
  }

  InputDecoration _dec(
      String h,
      bool o,
      VoidCallback t) {
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
      suffixIcon:
          IconButton(
        icon: Icon(o
            ? Icons.visibility
            : Icons
                .visibility_off),
        onPressed: t,
      ),
    );
  }
}
