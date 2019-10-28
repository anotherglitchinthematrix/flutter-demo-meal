import 'package:flutter/material.dart';
import 'package:course_007/category_detail_screen.dart';

import 'categories_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      home: CategoriesScreen(),
      routes: {
        CategoryDetailsScreen.routeName: (context) => CategoryDetailsScreen(),
      },
    );
  }
}
