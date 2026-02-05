import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        /// Loading
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        /// Success
        if (state is HomeSuccess) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: state.products.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                product: state.products[index],
              );
            },
          );
        }

        /// Error
        if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        }

        return const SizedBox();
      },
    );
  }
}
