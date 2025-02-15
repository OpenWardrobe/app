import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/outfit.model.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:openwardrobe/controllers/wardrobe_controller.dart';
import 'package:openwardrobe/ui/widgets/outfit/outfit_component.dart';
import 'package:openwardrobe/ui/widgets/wardrobe_item/wardrobe_item_component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WardrobeScreen extends ConsumerWidget {
  const WardrobeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wardrobeController = ref.watch(wardrobeControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Wardrobe')),
      body: FutureBuilder<List<WardrobeItem>>(
        future: wardrobeController.fetchWardrobeItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No items found'));
          } else {
            final items = snapshot.data!;

            return SingleChildScrollView(
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: items
                          .map((item) => WardrobeItemComponent(item: item))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder<List<Outfit>>(
                      future: wardrobeController.fetchOutfits(),
                      builder: (context, outfitSnapshot) {
                        if (outfitSnapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (outfitSnapshot.hasError) {
                          return Center(child: Text('Error: ${outfitSnapshot.error}'));
                        } else if (!outfitSnapshot.hasData || outfitSnapshot.data!.isEmpty) {
                          return const Center(child: Text('No outfits found'));
                        } else {
                          final outfits = outfitSnapshot.data!;

                          return Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: outfits
                                .map((outfit) => OutfitComponent(item: outfit))
                                .toList(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
