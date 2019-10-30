import 'package:course_007/models/index.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

// use hero image instead of normal image.
class MealScreen extends StatelessWidget {
  static const routeName = '/meal';

  final Function toggleFavorite;
  final Function isFavorite;

  MealScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSection(String head, List<String> list, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(64),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              head,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Text('${index + 1}. ${list[index]}');
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;

    // Get the main category of the food for color scheme.
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
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            isFavorite(meal) ? category.color : category.color.withAlpha(128),
        foregroundColor: Colors.black,
        child: isFavorite(meal) ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () => toggleFavorite(meal),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.only(bottom: 4),
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
                color: category.color.withAlpha(96),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_alarm),
                      SizedBox(width: 8),
                      Text(
                        meal.durationString,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.category),
                      SizedBox(width: 8),
                      Text(
                        meal.complexityString,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 8),
                      Text(
                        meal.affordabilityString,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), // Duration / Complexity / Affordability
            buildSection('Ingredients', meal.ingredients, category.color),
            // buildSection('Steps', meal.steps, category.color),
            Container(
                height: 300,
                child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: category.color.withAlpha(128),
                            foregroundColor: Colors.black,
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
