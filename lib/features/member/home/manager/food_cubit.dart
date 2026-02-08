import 'package:bloc/bloc.dart';
import 'package:gym_app/core/enums/food_enum.dart';
import 'package:meta/meta.dart';

import '../../data/models/meal_model.dart';

part 'food_state.dart';


class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  FoodCategory selectedCategory = FoodCategory.all;

  final List<FoodModel> _foods = [
    FoodModel(
      id: "1",
      nameAr: "فول مدمس",
      nameEn: "Ful Medames",
      calories: 187,
      protein: 13,
      quantity: "1 plate",
      category: FoodCategory.dinner,
    ),
    FoodModel(
      id: "2",
      nameAr: "كشري",
      nameEn: "Koshary",
      calories: 350,
      protein: 12,
      quantity: "1 bowl",
      category: FoodCategory.lunch,
    ),
    FoodModel(
      id: "3",
      nameAr: "سلطة فراخ",
      nameEn: "Chicken Salad",
      calories: 220,
      protein: 28,
      quantity: "1 bowl",
      category: FoodCategory.breakfast,
    ),
  ];

  void loadFoods() {
    emit(_buildLoadedState());
  }

  void changeCategory(FoodCategory category) {
    selectedCategory = category;
    emit(_buildLoadedState());
  }

  void logFood(String id) {
    final index = _foods.indexWhere((f) => f.id == id);
    if (index == -1) return;

    _foods[index].isLogged = true;
    emit(_buildLoadedState());
  }


  FoodLoaded _buildLoadedState() {
    final filteredFoods = _filteredFoods;

    return FoodLoaded(
      foods: filteredFoods,
      loggedFoods: _foods.where((e) => e.isLogged).toList(),
    );
  }

  List<FoodModel> get _filteredFoods {
    if (selectedCategory == FoodCategory.all) {
      return List.from(_foods);
    }
    return _foods
        .where((f) => f.category == selectedCategory)
        .toList();
  }
}

