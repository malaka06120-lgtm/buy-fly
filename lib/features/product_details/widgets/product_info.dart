import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/product_model.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// اسم المنتج
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 8),

        /// Rating 
        Row(
          children: [
            Row(
              children: List.generate(5, (i) {
                return Icon(
                  i < product.rate.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: AppColors.primary,
                  size: 20,
                );
              }),
            ),

            const SizedBox(width: 8),

            Text(
              product.rate.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// السعر
        Text(
          "\$${product.price}",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),

        const SizedBox(height: 18),

        /// عنوان الوصف
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 6),

        /// الوصف
        Text(
          product.description,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
