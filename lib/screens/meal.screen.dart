import 'package:course_007/models/index.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

// use hero image instead of normal image.
class MealScreen extends StatelessWidget {
  static const routeName = '/meal';
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    print(meal.categories);
    // Get the main category for color scheme.
    final Category category = DUMMY_CATEGORIES
        .firstWhere((category) => category.id == meal.categories[0]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(
          meal.title,
          overflow: TextOverflow.fade,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.network(
                meal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: category.color.withAlpha(100),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    SizedBox(width: 8),
                    Text('${meal.duration} min.'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.category),
                    SizedBox(width: 8),
                    Text(''),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(width: 8),
                    Text(''),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              'Ingredients',
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Text(meal.ingredients[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
