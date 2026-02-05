import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class PaymentMethodTile extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? AppColors.primary.withOpacity(0.15) : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        trailing: selected
            ? const Icon(Icons.check_circle,
                color: AppColors.primary)
            : const Icon(Icons.circle_outlined),
        onTap: onTap,
      ),
    );
  }
}
