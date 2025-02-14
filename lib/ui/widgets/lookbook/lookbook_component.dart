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
            // If it has a cover image try to get it otherwise nothing, if it fails to render remove too
            if (item.coverImageUrl != null && item.coverImageUrl!.isNotEmpty) 
              Image.network(
                item.coverImageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink(); // Remove the image if it fails to render
                },
              )
        ],
      ),
    );
  }
}