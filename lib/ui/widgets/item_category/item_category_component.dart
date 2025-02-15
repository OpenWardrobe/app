import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/item_category.model.dart';

class ItemCategoryComponent extends StatelessWidget {
  final ItemCategory itemCategory;

  const ItemCategoryComponent({super.key, required this.itemCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        itemCategory.name,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
