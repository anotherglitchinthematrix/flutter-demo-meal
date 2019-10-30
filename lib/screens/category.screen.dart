import 'package:flutter/material.dart';
import 'package:course_007/widgets/index.dart';
import 'package:course_007/models/index.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  final List<Meal> filteredMeals;
  CategoryScreen(this.filteredMeals);

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context).settings.arguments as Category;

    final List<Meal> meals = filteredMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(meals[index]);
          },
        ),
      ),
    );
  }
}
