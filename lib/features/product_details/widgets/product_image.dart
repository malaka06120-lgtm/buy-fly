import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Image.network(image, height: 200),
      ),
    );
  }
}
