import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class AddressFields
    extends StatelessWidget {
  final TextEditingController
      cityController;
  final TextEditingController
      addressController;

  const AddressFields({
    super.key,
    required this.cityController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextFormField(
          controller:
              cityController,
          decoration:
              _dec("City"),
          validator: (v) =>
              v!.isEmpty
                  ? "Required"
                  : null,
        ),

        const SizedBox(
            height: 15),

        TextFormField(
          controller:
              addressController,
          decoration:
              _dec("Address"),
          validator: (v) =>
              v!.isEmpty
                  ? "Required"
                  : null,
        ),

        const SizedBox(
            height: 15),
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
