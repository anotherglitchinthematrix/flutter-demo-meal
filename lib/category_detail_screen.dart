import 'package:flutter/material.dart';

import 'models/category.model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Category category;

  CategoryDetailsScreen(
    this.category,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text('${category.title}'),
      ),
      body: Center(
        child: Text('Category Detail'),
      ),
    );
  }
}
