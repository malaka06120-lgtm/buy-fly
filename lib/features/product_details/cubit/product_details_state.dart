import '../../../data/models/product_model.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product product;
  final int quantity;

  ProductDetailsLoaded(this.product, this.quantity);
}
