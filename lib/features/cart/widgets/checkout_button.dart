import 'package:flutter/material.dart';
import 'package:gigastore/features/payment/payment_screen.dart';
import '../../../core/constants/colors.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

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
        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const PaymentScreen(),
    ),
  );
},

        child: const Text(
          "Checkout",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
