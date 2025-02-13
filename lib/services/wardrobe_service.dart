import '../repositories/wardrobe_repository.dart';
import '../models/wardrobe_item.dart';

class WardrobeService {
  final WardrobeRepository wardrobeRepository;

  WardrobeService(this.wardrobeRepository);

  Future<List<WardrobeItem>> getWardrobeItems() async {
    return await wardrobeRepository.fetchItems();
  }

  Future<WardrobeItem> getWardrobeItem(String id) async {
    return await wardrobeRepository.fetchItem(id);
  }

  Future<void> addWardrobeItem(WardrobeItem item) async {
    await wardrobeRepository.addItem(item);
  }

  // fetchPublicItemsByUser
  Future<List<WardrobeItem>> fetchPublicItemsByUser(String userId) async {
    return await wardrobeRepository.fetchPublicItemsByUser(userId);
  }

  Future<void> syncWardrobe() async {
    await wardrobeRepository.syncLocalChanges();
  }
}
