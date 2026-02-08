import '../../../../../core/enums/categories.dart';

class ProductModel {
  final String? title;
  final ProductCategory? category;
  final String? image;
  final double? price;
  final double? rating;

  const ProductModel({
    this.title,
    this.category,
    this.image,
    this.price,
    this.rating,
  });
}
