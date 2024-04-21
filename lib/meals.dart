import 'package:flutter/material.dart';
import 'package:mealsapp/meal_detail.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widget/mealitem.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen(this.meals, {super.key, this.title});
  final String? title;
  final List<Meal> meals;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsDetails(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('Oops!! its Empty!!',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white)),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onselect: (meal) {
                  selectMeal(context, meal);
                },
              ));
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
