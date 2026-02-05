import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/product_model.dart';
import '../../../../data/repositories/product_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository repo;

  HomeCubit(this.repo) : super(HomeInitial());

  List<Product> allProducts = [];

  List<String> categories = [];

  Future<void> getProducts() async {
    try {
      emit(HomeLoading());

      final products = await repo.getAllProducts();

      allProducts = products;

      categories = products
          .map((p) => p.category)
          .toSet()
          .toList();

      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void filterByCategory(String category) {
    final filtered = allProducts
        .where((p) => p.category == category)
        .toList();

    emit(HomeSuccess(filtered));
  }

  void showAllProducts() {
    emit(HomeSuccess(allProducts));
  }
}
