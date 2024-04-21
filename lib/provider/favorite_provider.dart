import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/model/meal.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>> {
  FavMealsNotifier() : super([]);

  void toggleMealStat(Meal meal) {
    final isfav = state.contains(meal);
    if (isfav) {
      state = state.where((m) {
        return m.id != meal.id;
      }).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favmealsprovider =
    StateNotifierProvider<FavMealsNotifier, List<Meal>>((ref) {
  return FavMealsNotifier();
});
