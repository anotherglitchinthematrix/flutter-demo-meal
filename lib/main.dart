import 'package:course_007/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:course_007/screens/index.dart';

import 'models/index.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Map<String, bool> _filters = {
    'gluten': true,
    'lactose': true,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _meals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _meals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isMealFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      home: TabsScreen(_favoriteMeals),
      routes: {
        CategoryScreen.routeName: (context) => CategoryScreen(_meals),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
        CategoriesScreen.routeName: (context) => CategoriesScreen(),
        MealScreen.routeName: (context) =>
            MealScreen(_toggleFavorite, _isMealFavorite),
      },
    );
  }
}
