import '../../../../core/enums/food_enum.dart';

class FoodModel {
  final String id;
  final String nameAr;
  final String nameEn;
  final int calories;
  final int protein;
  final String quantity;
  final FoodCategory category;
  bool isLogged;

  FoodModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.calories,
    required this.protein,
    required this.quantity,
    required this.category,
    this.isLogged = false,
  });
}
