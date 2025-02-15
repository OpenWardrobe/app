import 'package:flutter/material.dart';
import 'package:openwardrobe/brick/models/wardrobe_item.model.dart';
import 'package:openwardrobe/di/service_locator.dart';

class WardrobeController extends ChangeNotifier {
  Future<List<WardrobeItem>> fetchWardrobeItems() async {
    try {
      return await appRepository.getAll<WardrobeItem>();
    } catch (e) {
      // Handle error
      return [];
    }
  }

  Future<void> addItem(WardrobeItem item) async {
    try {
      await appRepository.upsert<WardrobeItem>(item);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteItem(WardrobeItem item) async {
    try {
      await appRepository.delete<WardrobeItem>(item);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> updateItem(WardrobeItem item) async {
    try {
      await appRepository.upsert<WardrobeItem>(item);
    } catch (e) {
      // Handle error
    }
  }
}
