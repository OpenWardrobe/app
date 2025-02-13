import 'package:flutter/material.dart';

class WarderobeCategory extends StatelessWidget {
  final String text;
  final Image image;
  final bool isSelected;
  final VoidCallback onTap;

  const WarderobeCategory({super.key, required this.text, required this.image, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        // Padding top
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: image.image,
                  fit: BoxFit.cover,
                ),
                border: isSelected ? Border.all(color: Colors.primaries.last, width: 3) : null,
                boxShadow: isSelected
                    ? [BoxShadow(color: Colors.primaries.last, blurRadius: 10, spreadRadius: 1)]
                    : [],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
