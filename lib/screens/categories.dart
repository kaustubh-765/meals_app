import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals.where((meals) => meals.categories.contains(category.id)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MeaslScreen(
              title: category.title,
              meals: filteredMeals,
              // onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // ALternative :
          // availableCategories.map((category) => CategoryGridItem(category: category)).tolist()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onselect: () {
                _selectCategory(context, category);
              },
            )
        ],
    );
  }
}
