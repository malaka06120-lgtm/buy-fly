import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model.dart';
import 'cubit/product_details_cubit.dart';
import 'cubit/product_details_state.dart';
import 'widgets/product_image.dart';
import 'widgets/quantity_selector.dart';
import 'widgets/add_to_cart_button.dart';
import 'widgets/product_info.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(product),
      child: Scaffold(
        appBar: AppBar(
         title: Text(
        product.title,
         maxLines: 1,
         overflow: TextOverflow.ellipsis,
         ),
        ),


        body: BlocBuilder<ProductDetailsCubit,
            ProductDetailsState>(
          builder: (context, state) {
            final s =
                state as ProductDetailsLoaded;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          ProductImage(
                              image: s.product.image),

                          const SizedBox(height: 20),

                          ProductInfo(
                              product: s.product),

                          const SizedBox(height: 20),

                          /// quantity
                          const Text(
                            "Quantity",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          QuantitySelector(),
                        ],
                      ),
                    ),
                  ),

          
                  AddToCartButton(product: s.product,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
