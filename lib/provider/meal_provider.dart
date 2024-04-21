import 'package:mealsapp/data/dummydata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealprofider = Provider((ref) {
  return dummyMeals;
});
