import 'package:flutter/material.dart';
import 'package:mealsapp/categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/meals.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widget/filters.dart';
import 'package:mealsapp/widget/main_drawer.dart';
import 'package:mealsapp/provider/favorite_provider.dart';
import 'package:mealsapp/provider/filters_provider.dart';

final kInitialfilter = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.veg: false,
  Filter.vegan: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({
    super.key,
  });
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends ConsumerState<TabScreen> {
  final List<Meal> favmeal = [];

  int selectedPageIndex = 0;
  void _selectPage(int val) {
    selectedPageIndex = val;
    setState(() {});
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
     await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (ctx) => FilterScreen()),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final filteredlist = ref.watch(filteredListProvider);
    Widget active = CategoriesScreen(
      filteredlist: filteredlist,
    );
    String activetitle = 'Categories';
    if (selectedPageIndex == 1) {
      final favmealp = ref.watch(favmealsprovider);
      activetitle = 'Favourites';
      active = MealsScreen(
        favmealp,
      );
    } else {
      activetitle = 'Categories';
      active = CategoriesScreen(
        filteredlist: filteredlist,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activetitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: active,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: 'Favourites'),
        ],
      ),
    );
  }
}
