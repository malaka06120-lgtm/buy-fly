import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/product_details_cubit.dart';
import '../cubit/product_details_state.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit,
        ProductDetailsState>(
      builder: (context, state) {
        final s = state as ProductDetailsLoaded;

        return Row(
          children: [
            IconButton(
              onPressed: () => context
                  .read<ProductDetailsCubit>()
                  .decreaseQty(),
              icon: const Icon(Icons.remove),
            ),
            Text(
              s.quantity.toString(),
              style: const TextStyle(fontSize: 18),
            ),
            IconButton(
              onPressed: () => context
                  .read<ProductDetailsCubit>()
                  .increaseQty(),
              icon: const Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
