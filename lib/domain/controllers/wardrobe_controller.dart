import 'package:flutter/material.dart';
import 'package:openwardrobe/domain/models/wardrobe_item.model.dart';
import 'package:openwardrobe/data/repositories/app_repository.dart';
import 'package:get_it/get_it.dart';

class WardrobeController extends ChangeNotifier {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  List<WardrobeItem>? _wardrobeItems;
  List<WardrobeItem>? get wardrobeItems => _wardrobeItems;

  Future<List<WardrobeItem>> fetchWardrobeItems() async {
    try {
      final items = await _appRepository.get<WardrobeItem>();
      _wardrobeItems = items;
      notifyListeners();
      return items;
    } catch (e) {
      // Handle error
      print('Error fetching wardrobe items: $e');
      return [];
    }
  }

  Future<void> addItem(WardrobeItem item) async {
    try {
      await _appRepository.upsert<WardrobeItem>(item);
      fetchWardrobeItems(); // Refresh the list after adding an item
    } catch (e) {
      // Handle error
      print('Error adding wardrobe item: $e');
    }
  }

  Future<void> deleteItem(WardrobeItem item) async {
    try {
      await _appRepository.delete<WardrobeItem>(item);
      fetchWardrobeItems(); // Refresh the list after deleting an item
    } catch (e) {
      // Handle error
      print('Error deleting wardrobe item: $e');
    }
  }

  Future<void> updateItem(WardrobeItem item) async {
    try {
      await _appRepository.upsert<WardrobeItem>(item);
      fetchWardrobeItems(); // Refresh the list after updating an item
    } catch (e) {
      // Handle error
      print('Error updating wardrobe item: $e');
    }
  }
}
