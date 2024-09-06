import 'package:flutter/material.dart';
import 'package:my_applecitne/app_data.dart';
import '../widget/category_item.dart';

class CatogarseScrene extends StatelessWidget {
  const CatogarseScrene({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 190,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map(
        (categoriesData) => CategoryItem(
          categoriesData.id,
          categoriesData.title,
          categoriesData.imageUrl,
        ),
      ).toList(),
    );
  }
}
