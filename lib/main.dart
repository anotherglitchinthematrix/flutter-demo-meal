import 'package:flutter/material.dart';
import 'package:course_007/screens/index.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      home: TabsScreen(),
      routes: {
        CategoryScreen.routeName: (context) => CategoryScreen(),
        FavoritesScreen.routeName: (context) => FavoritesScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        MealScreen.routeName: (context) => MealScreen(),
      },
    );
  }
}
