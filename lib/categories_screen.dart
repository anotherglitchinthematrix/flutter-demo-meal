import 'package:course_007/category_item.dart';
import 'package:course_007/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MealApp'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map((category) => CategoryItem(category))
              .toList(),
        ],
      ),
    );
  }
}
