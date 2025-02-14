import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';

class LookbookComponent extends StatelessWidget {
  final Lookbook item;

  const LookbookComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(maxWidth: 400), // Set max width like a card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (item.description != null) 
            Text(
              item.description!,
              style: TextStyle(fontSize: 16),
            ),
          const SizedBox(height: 10),
          if (item.coverImageUrl != null) 
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.coverImageUrl!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          if (item.tags != null && item.tags!.isNotEmpty) 
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: item.tags!.map((tag) {
                return Chip(
                  label: Text(tag),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}