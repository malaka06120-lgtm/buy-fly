import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import 'product_details_state.dart';

class ProductDetailsCubit
    extends Cubit<ProductDetailsState> {

  ProductDetailsCubit(Product product)
      : super(ProductDetailsLoaded(product, 1));

  void increaseQty() {
    final s = state as ProductDetailsLoaded;
    emit(ProductDetailsLoaded(
        s.product, s.quantity + 1));
  }

  void decreaseQty() {
    final s = state as ProductDetailsLoaded;

    if (s.quantity > 1) {
      emit(ProductDetailsLoaded(
          s.product, s.quantity - 1));
    }
  }
}
