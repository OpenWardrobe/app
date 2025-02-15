import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';

class WardrobeItemCard extends StatelessWidget {
  final WardrobeItem item;
  final VoidCallback? onTap;
  // size
  final double? size;

  const WardrobeItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.size = 200,
  });

  

  // Was this item added today?
  bool get isNew => item.createdAt.difference(DateTime.now()).inDays == 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isNew ? BorderSide(color: Colors.green, width: 2) : BorderSide.none,
        ),
        shadowColor: isNew ? Colors.green : Colors.black,
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1737587653765-94bc8fe7b541?q=80&w=1031&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    height: size,
                    width: size,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            if (isNew)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.favorite_border),
                color: Colors.black,
                onPressed: () {
                  // Handle heart button press
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
