import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final isGlutenFree;
  final isLactoseFree;
  final isVegan;
  final isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageURL,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  String get durationString {
    bool flag = duration / 60 >= 1;
    if (flag) {
      return '${(duration / 60).toStringAsFixed(1)} hrs.';
    } else {
      return '$duration min.';
    }
  }

  String get complexityString {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown Complexity';
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown Affordability';
    }
  }
}
