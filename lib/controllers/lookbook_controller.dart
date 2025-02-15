import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openwardrobe/repositories/app_repository.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';

final lookbookControllerProvider = Provider<LookbookController>((ref) => LookbookController(ref));

class LookbookController {
  final AppRepository _appRepository;

  LookbookController(ref) : _appRepository = ref.read(appRepositoryProvider);

  Future<List<Lookbook>> fetchLookbookItems() async {
    try {
      return await _appRepository.get<Lookbook>();
    } catch (e) {
      throw Exception('Failed to fetch lookbook items: $e');
    }
  }
}
