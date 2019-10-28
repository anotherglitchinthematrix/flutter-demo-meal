import 'package:flutter/material.dart';

import 'models/category.model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const routeName = '/category-detail';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) {
            return Text('');
          },
        ),
      ),
    );
  }
}
