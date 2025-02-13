import 'package:flutter/material.dart';

import 'package:openwardrobe/services/wardrobe_service.dart';
import 'package:openwardrobe/repositories/wardrobe_repository.dart';
import 'package:openwardrobe/models/wardrobe_item.dart';
import 'package:openwardrobe/ui/widgets/wardrobe/item.dart';

class WardrobeItemPage extends StatelessWidget {
  final String id;

  const WardrobeItemPage({super.key, required this.id});

  Future<WardrobeItem> _getItem() async {
    final wardrobeService = WardrobeService(WardrobeRepository());
    return await wardrobeService.getWardrobeItem(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: FutureBuilder<WardrobeItem>(
          future: _getItem(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final item = snapshot.data!;
              
              return Column(
                children: [
                  WardrobeItemCard(item: item, size:500),
                  const SizedBox(height: 16),
                  // Info about the item, the name
                  Text(item.name, style: Theme.of(context).textTheme.headlineLarge),
                ],
              );
            } else {
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }
}