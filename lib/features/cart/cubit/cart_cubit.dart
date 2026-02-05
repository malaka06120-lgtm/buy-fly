import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartUpdated([]));

  void addToCart(Product product) {
    final current =
        (state as CartUpdated).items;

    emit(CartUpdated([...current, product]));
  }

  void removeFromCart(Product product) {
    final current =
        (state as CartUpdated).items;

    current.remove(product);
    emit(CartUpdated([...current]));
  }

  double getTotal() {
    final current =
        (state as CartUpdated).items;

    return current.fold(
        0, (sum, item) => sum + item.price);
  }
}
