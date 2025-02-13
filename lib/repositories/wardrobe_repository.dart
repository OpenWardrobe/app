import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';
import '../models/wardrobe_item.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class WardrobeRepository {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  // Fetch items from Supabase or from local storage if offline
  Future<List<WardrobeItem>> fetchItems() async {
    final isOnline = await _checkConnectivity();
    if (isOnline) {
      try {
        final response = await supabaseClient.from('wardrobe_item').select();  // Gebruik get() in plaats van execute()
      final items = (response as List).map((item) => WardrobeItem.fromJson(item)).toList();
      await _cacheItemsLocally(items);  // Cache de items lokaal
      return items;
      } catch (error) {
        print('Error fetching items: $error');
        return await _fetchItemsFromLocal();  // Haal items op uit lokale opslag
      }
    } else {
      return await _fetchItemsFromLocal();  // Haal items op uit lokale opslag
    }
  }

  // fetch Item
  Future<WardrobeItem> fetchItem(String id) async {
    final isOnline = await _checkConnectivity();
    if (isOnline) {
      final response = await supabaseClient.from('wardrobe_item').select().eq('id', id).single();
      final item = WardrobeItem.fromJson(response);
      return item;
    } else {
      final items = await _fetchItemsFromLocal();
      return items.firstWhere((item) => item.id == id);
    }
  }

  // Voeg een nieuw item toe, afhankelijk van netwerkstatus
  Future<void> addItem(WardrobeItem item) async {
    final isOnline = await _checkConnectivity();
    if (isOnline) {
      await supabaseClient.from('wardrobe_item').insert(item.toJson()).select();  // Gebruik select() om de insert te bevestigen
    } else {
      await _saveItemLocally(item, isSynced: false);  // Opslaan als niet-gesynchroniseerd
    }
  }

  // Synchroniseer lokale wijzigingen met Supabase
  Future<void> syncLocalChanges() async {
    final box = await Hive.openBox<WardrobeItem>('wardrobe_item');
    final unsyncedItems = box.values.where((item) => !item.isSynced).toList();

    for (var item in unsyncedItems) {
      await supabaseClient.from('wardrobe_item').insert(item.toJson()).select();
      item.isSynced = true;
      await item.save();  // Update lokale opslagstatus
    }
  }

  // fetchPublicItemsByUser(userId)
  Future<List<WardrobeItem>> fetchPublicItemsByUser(String userId) async {
    final response = await supabaseClient.from('wardrobe_item').select().eq('user_id', userId);
    return (response as List).map((item) => WardrobeItem.fromJson(item)).toList();
  }

  // Cache items lokaal met Hive
  Future<void> _cacheItemsLocally(List<WardrobeItem> items) async {
    final box = await Hive.openBox<WardrobeItem>('wardrobe_item');
    await box.clear();
    for (var item in items) {
      await box.put(item.id, item);
    }
  }

  // Haal items op uit lokale Hive opslag
  Future<List<WardrobeItem>> _fetchItemsFromLocal() async {
    final box = await Hive.openBox<WardrobeItem>('wardrobe_item');
    return box.values.toList();
  }

  // Controleer netwerkverbinding
  Future<bool> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult[0] != ConnectivityResult.none;
  }

  // Voeg ontbrekende methode toe voor lokaal opslaan van items
  Future<void> _saveItemLocally(WardrobeItem item, {bool isSynced = true}) async {
    final box = await Hive.openBox<WardrobeItem>('wardrobe_item');
    item.isSynced = isSynced;
    await box.put(item.id, item);
  }
}
