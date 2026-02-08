import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/categories.dart';
import '../data/models/product_model.dart';
import 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketInitial());

  final List<ProductModel> _allProducts = [
    ProductModel(
      title: 'Whey Protein Isolate',
      category: ProductCategory.supplements,
      image: 'assets/images/gym.webp',
      price: 49.99,
      rating: 4.8,
    ),
    ProductModel(
      title: 'Pre-Workout Ignite',
      category: ProductCategory.supplements,
      image: 'assets/images/gym.webp',
      price: 34.50,
      rating: 4.6,
    ),
  ];

  void loadProducts() async {
    emit(MarketLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    if (_allProducts.isEmpty) {
      emit(MarketEmpty(ProductCategory.all));
    } else {
      emit(
        MarketLoaded(
          products: _allProducts,
          selectedCategory: ProductCategory.all,
        ),
      );
    }
  }

  void searchProducts(String query) {
    final currentCategory = state is MarketLoaded
        ? (state as MarketLoaded).selectedCategory
        : ProductCategory.all;

    final filtered = _allProducts.where((p) {
      final matchesCategory = currentCategory == ProductCategory.all
          ? true
          : p.category == currentCategory;
      final matchesQuery = query.isEmpty
          ? true
          :
      p.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
      return matchesCategory && matchesQuery;
    }).toList();

    if (filtered.isEmpty) {
      emit(MarketEmpty(currentCategory));
    } else {
      emit(MarketLoaded(products: filtered, selectedCategory: currentCategory));
    }
  }
  void filterByCategory(ProductCategory category) {
    emit(MarketLoading());

    final List<ProductModel> filtered;

    if (category == ProductCategory.all) {
      filtered = _allProducts;
    } else {
      filtered = _allProducts
          .where((product) => product.category == category)
          .toList();
    }

    if (filtered.isEmpty) {
      emit(MarketEmpty(category));
    } else {
      emit(
        MarketLoaded(
          products: filtered,
          selectedCategory: category,
        ),
      );
    }
  }
}
