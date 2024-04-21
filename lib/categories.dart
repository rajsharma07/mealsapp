import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummydata.dart';
import 'package:mealsapp/meals.dart';
import 'package:mealsapp/model/category.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widget/categoryItem.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.filteredlist});
  final List<Meal> filteredlist;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationcontroller;
  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);
    _animationcontroller.forward();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  void _selectcategory(BuildContext context, Category c) {
    List<Meal> m = widget.filteredlist.where(
      (element) {
        return element.categories.contains(c.id);
      },
    ).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealsScreen(m, title: c.title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationcontroller,
      builder: (context, child) => SlideTransition(
        position: _animationcontroller.drive(
          Tween(
            begin: Offset(0,1),
            end: Offset(0,0),
          ),

        ),
        child: child,
      ),
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final c in availableCategories)
            CategoryItem(() {
              _selectcategory(context, c);
            }, c: c)
        ],
      ),
    );
  }
}
