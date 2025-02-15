import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WardrobeItemComponent extends StatelessWidget {
  final WardrobeItem item;
  final bool isSelected;
  final VoidCallback? onTap; // New: Callback to toggle selection

  const WardrobeItemComponent({
    super.key,
    required this.item,
    this.isSelected = false, // Default: Not selected
    this.onTap, // New: Function to toggle selection
  });

  @override
  Widget build(BuildContext context) {
    const size = 110.00;

    return GestureDetector( // New: Wrap in GestureDetector
      onTap: onTap, // Call the function when tapped
      child: Container(
        decoration: BoxDecoration(
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.blue.withOpacity(0.5), blurRadius: 8, spreadRadius: 1)]
              : null,
        ),
        child: Column(
          children: [
            FutureBuilder<String>(
              future: Supabase.instance.client.storage
                  .from('wardrobe-items')
                  .createSignedUrl(item.imagePath, 3600), // 1 hour expiry
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (snapshot.hasError || !snapshot.hasData) {
                  return Container(
                    height: size,
                    width: size,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 50),
                  );
                }

                return Image.network(
                  snapshot.data!,
                  height: size,
                  width: size,
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}