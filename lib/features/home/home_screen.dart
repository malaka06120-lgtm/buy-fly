import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/cart_screen.dart'; 
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'widgets/product_grid.dart';
import 'widgets/categories_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      appBar: AppBar(
        title: const Text("Products"),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const CartScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {

          /// Loading
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          /// Success
          if (state is HomeSuccess) {
            final cubit =
                context.read<HomeCubit>();

            return Column(
              children: [

                
                CategoriesRow(
                  categories: cubit.categories,
                ),

                const SizedBox(height: 10),

                
                const Expanded(
                  child: ProductsGrid(),
                ),
              ],
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
      ),
    );
  }
}
