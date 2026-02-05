import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class ConfirmPaymentButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfirmPaymentButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          "Confirm Payment",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
