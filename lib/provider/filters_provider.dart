import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/meal_provider.dart';

enum Filter {
  glutenFree,
  lactosFree,
  veg,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactosFree: false,
          Filter.veg: false,
          Filter.vegan: false,
        });
      
    void setFilters(Map<Filter, bool> m){
      state = m;
    }
    void setFilter(Filter f, bool isActive){
      state = {
        ...state,
        f : isActive
      };
    }
}

final filterprovider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());



final filteredListProvider = Provider((ref){
  final mealslist = ref.watch(mealprofider);
  final activefilter = ref.watch(filterprovider);
  return mealslist.where((m) {
      if (activefilter[Filter.glutenFree]! && !m.isGlutenFree) {
        return false;
      }
      if (activefilter[Filter.lactosFree]! && !m.isLactoseFree) {
        return false;
      }
      if (activefilter[Filter.veg]! && !m.isVegetarian) {
        return false;
      }
      if (activefilter[Filter.vegan]! && !m.isVegan) {
        return false;
      }
      return true;
    }).toList();
});