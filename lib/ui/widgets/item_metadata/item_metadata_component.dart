import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/item_metadata.model.dart';

class ItemMetadataComponent extends StatelessWidget {
  final ItemMetadata item;

  const ItemMetadataComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Item Metadata Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Bought For: ${item.boughtFor ?? 'N/A'} ${item.currency}'),
          Text('Purchase Date: ${item.purchaseDate ?? 'N/A'}'),
          Text('Condition: ${item.condition ?? 'N/A'}'),
          Text('Material: ${item.material ?? 'N/A'}'),
          Text('Size: ${item.size ?? 'N/A'}'),
          Text('Color: ${item.color ?? 'N/A'}'),
          Text('Notes: ${item.notes ?? 'N/A'}'),
          Text('Created At: ${item.createdAt}'),
          Text('Updated At: ${item.updatedAt}'),
        ],
      ),
    );
  }
}
