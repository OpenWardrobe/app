import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WardrobeItemComponent extends StatelessWidget {
  final WardrobeItem item;

  const WardrobeItemComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    const size = 110.00;

    return Column(
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
    );
  }
}