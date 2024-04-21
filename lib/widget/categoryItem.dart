import 'package:flutter/material.dart';
import 'package:mealsapp/model/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
    this._selectcategory, {
    super.key,
    required this.c,
  });
  final Category c;
  final void Function() _selectcategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectcategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            c.color.withOpacity(0.55),
            c.color.withOpacity(0.9),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          c.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
