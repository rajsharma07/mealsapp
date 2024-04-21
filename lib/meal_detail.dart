import 'package:flutter/material.dart';
import 'package:mealsapp/model/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/favorite_provider.dart';

class MealsDetails extends ConsumerWidget {
  const MealsDetails({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favlist = ref.watch(favmealsprovider);
    bool isfav = favlist.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favmealsprovider.notifier).toggleMealStat(meal);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 300,
              ),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween<double>(begin: 0.9, end: 1.0).animate(
                    animation,
                  ),
                  child: child,
                );
              },
              child: Icon(
                isfav ? Icons.star : Icons.star_border_outlined,
                key: ValueKey(isfav),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Intregients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            for (final i in meal.ingredients)
              Text(
                i,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            for (final i in meal.steps)
              Text(
                i,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
