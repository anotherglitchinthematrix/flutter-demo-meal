import 'package:flutter/material.dart';
import 'package:course_007/models/index.dart';
import 'package:course_007/screens/index.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(
    this.category,
  );

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryScreen.routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.8),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: category.color,
            width: 2.0,
          ),
        ),
        padding: const EdgeInsets.all(16),
        alignment: Alignment.bottomRight,
        child: Text(
          category.title,
          style: TextStyle(
            color: Colors.black.withAlpha(128),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
