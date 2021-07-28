import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/category_items.dart';

class categoriesScreen extends StatelessWidget {
  static const String id = 'categoriesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: Categories_data.map( (categoryData) =>
            categoryItems(categoryData.id,categoryData.title,categoryData.imageUrl),
            ).toList(),
      ),
    );
  }
}
