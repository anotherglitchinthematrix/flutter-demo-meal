import 'package:course_007/models/index.dart';
import 'package:course_007/widgets/meal_item.widget.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';

  final List<Meal> meals;

  FavoritesScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    if (meals.length == 0) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star),
          Text('Your Favorite list is empty'),
        ],
      ));
    }

    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        Meal meal = meals[index];
        return MealItem(meal);
      },
    );
  }
}
