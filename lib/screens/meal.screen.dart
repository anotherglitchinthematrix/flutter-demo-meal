import 'package:course_007/models/index.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
