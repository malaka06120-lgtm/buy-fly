import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../data/models/product_model.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 50,
        ),
        title: Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        subtitle: Text(
          "\$${product.price}",
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete,
              color: Colors.red),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
