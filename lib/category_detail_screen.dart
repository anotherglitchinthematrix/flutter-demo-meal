import 'package:flutter/material.dart';
import 'package:course_007/dummy_data.dart';

import 'models/category.model.dart';
import 'models/meal.model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const routeName = '/category-detail';

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context).settings.arguments as Category;

    final List<Meal> categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return Text(categoryMeals[index].title);
          },
        ),
      ),
    );
  }
}
