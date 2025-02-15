import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/outfit.model.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:openwardrobe/ui/widgets/wardrobe_item/wardrobe_item_component.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OutfitComponent extends StatelessWidget {
  final Outfit item;

  const OutfitComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: item.outfitItems.map((outfitItem) {
              return WardrobeItemComponent(item: outfitItem.wardrobeItem);
            }).toList(),
          ),
          Text(
            item.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}