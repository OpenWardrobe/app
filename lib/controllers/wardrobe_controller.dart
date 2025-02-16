import 'package:brick_core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:openwardrobe/brick/models/outfit.model.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';

class WardrobeController {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  Future<List<WardrobeItem>> fetchWardrobeItems() async {
    try {
      return await _appRepository.get<WardrobeItem>();
    } catch (e) {
      // Handle error
      throw Exception('Failed to fetch wardrobe items: $e');
    }
  }

  Future<List<Outfit>> fetchOutfits() async {
    try {
      return await _appRepository.get<Outfit>();

    } catch (e) {
      // Handle error
      throw Exception('Failed to fetch outfits: $e');
    }
  }

  Future<int> fetchWardrobeItemCount() async {
    try {
      final items = await fetchWardrobeItems();
      return items.length;
    } catch (e) {
      // Handle error
      throw Exception('Failed to fetch wardrobe item count: $e');
    }
  }
}
