import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/lookbook_item.model.dart';

class LookbookItemComponent extends StatelessWidget {
  final LookbookItem item;

  const LookbookItemComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(maxWidth: 400), // Set max width like a card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.itemId,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            item.itemType,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            item.createdAt.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
