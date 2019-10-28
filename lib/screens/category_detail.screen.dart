import 'package:course_007/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:course_007/models/index.dart';
import 'package:course_007/dummy_data.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const routeName = '/category-detail';

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context).settings.arguments as Category;

    final List<Meal> meals = DUMMY_MEALS
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
