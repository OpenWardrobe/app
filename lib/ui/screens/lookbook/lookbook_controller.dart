import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openwardrobe/brick/models/lookbook.model.dart';
import 'package:openwardrobe/repositories/app_repository.dart';

class LookbookController extends ChangeNotifier {
  final AppRepository _appRepository = GetIt.instance<AppRepository>();

  List<Lookbook>? _lookbooks;
  List<Lookbook>? get lookbooks => _lookbooks;

  Future<List<Lookbook>> fetchLookbooks() async {
    try {
      final lookbooks = await _appRepository.get<Lookbook>();
      _lookbooks = lookbooks;
      notifyListeners();
      return lookbooks;
    } catch (e) {
      // Handle error
      print('Error fetching lookbooks: $e');
      return [];
    }
  }

  void handleAddLookbook(BuildContext context) {
    Navigator.pushNamed(context, '/lookbook/add');
  }

  void handleEditLookbook(Lookbook lookbook) {
    // Handle edit lookbook logic
  }

  void handleDeleteLookbook(Lookbook lookbook) {
    // Handle delete lookbook logic
  }
}
