import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/colors.dart';
import 'cubit/cart_cubit.dart';
import 'cubit/cart_state.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/cart_total_section.dart';
import 'widgets/checkout_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartItems =
                (state as CartUpdated).items;

            if (cartItems.isEmpty) {
              return const Center(
                child: Text(
                  "Cart is empty 🛒",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            final total =
                context.read<CartCubit>().getTotal();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          product: cartItems[index],
                          onRemove: () {
                            context
                                .read<CartCubit>()
                                .removeFromCart(
                                    cartItems[index]);
                          },
                        );
                      },
                    ),
                  ),

                  CartTotalSection(total: total),

                  const SizedBox(height: 15),

                  const CheckoutButton(),
                ],
              ),
            );
          },
        ),
      );
  }
}
