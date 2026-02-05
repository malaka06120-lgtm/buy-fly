import '../../../data/models/product_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<Product> items;

  CartUpdated(this.items);
}
