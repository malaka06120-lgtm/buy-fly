import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../cart/cubit/cart_cubit.dart';
import '../../../core/constants/colors.dart';

class AddToCartButton extends StatelessWidget {
    final Product product;

  const AddToCartButton({super.key,required this.product,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
        ),
         onPressed: () {

          
          context.read<CartCubit>().addToCart(product);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to cart"),
            ),
          );
        },
        child: const Text("Add to Cart"),
      ),
    );
  }
}
