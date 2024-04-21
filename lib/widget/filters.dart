import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealsapp/provider/filters_provider.dart';


class FilterScreen extends ConsumerWidget {
  FilterScreen({super.key});  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilter = ref.watch(filterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('filters'),
      ),
      body:Column(
          children: [
            SwitchListTile(
              value: activefilter[Filter.glutenFree]!,
              onChanged: (bool b) {
                ref.read(filterprovider.notifier).setFilter(Filter.glutenFree, b);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Gluten free dishes',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
            SwitchListTile(
              value: activefilter[Filter.lactosFree]!,
              onChanged: (bool b) {
                ref.read(filterprovider.notifier).setFilter(Filter.lactosFree, b);
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactos free dishes',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
            SwitchListTile(
              value: activefilter[Filter.veg]!,
              onChanged: (bool b) {
                  ref.read(filterprovider.notifier).setFilter(Filter.veg, b);
              },
              title: Text(
                'Vegatarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vagetrian dishes',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            ),
            SwitchListTile(
              value: activefilter[Filter.vegan]!,
              onChanged: (bool b) {
                   ref.read(filterprovider.notifier).setFilter(Filter.vegan, b);

              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan dishes',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
            )
          ],
        ),
      );
  }
}
