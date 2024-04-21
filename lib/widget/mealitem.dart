import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:mealsapp/widget/mealmetadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onselect,
  });

  final Meal meal;
  final void Function(Meal meal) onselect;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselect(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MealMetaData(
                            data: '${meal.duration}min', icon: Icons.schedule),
                        MealMetaData(
                            data: meal.complexity.name.toUpperCase(),
                            icon: Icons.work),
                        MealMetaData(
                            data: meal.affordability.name,
                            icon: Icons.attach_money)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
