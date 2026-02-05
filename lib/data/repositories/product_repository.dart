import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService api;

  ProductRepository(this.api);

  Future<List<Product>> getAllProducts() async {
    final data = await api.getProducts();

    return data
        .map<Product>((json) => Product.fromJson(json))
        .toList();
  }
}
