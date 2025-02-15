import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openwardrobe/repositories/app_repository.dart';

final cameraControllerProvider = Provider((ref) => CameraController(ref.read));

class CameraController {
  final AppRepository _appRepository;

  CameraController(read) : _appRepository = read(appRepositoryProvider);

  Future<List<File>> pickImages({bool fromGallery = false}) async {
    if (kIsWeb) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.map((file) => File(file.path!)).toList();
      } else {
        throw Exception('No images selected');
      }
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      );

      if (pickedFile != null) {
        return [File(pickedFile.path)];
      } else {
        throw Exception('No image selected');
      }
    }
  }

  Future<void> uploadImages(List<File> images) async {
    try {
      for (var imageFile in images) {
        // Implement upload logic for images (e.g., upload to Supabase)
        // Example: await _appRepository.supabaseProvider.client.storage.from('wardrobe').upload(imageFile.path, imageFile);
      }
    } catch (e) {
      throw Exception('Failed to upload images: $e');
    }
  }

  Future<void> uploadWebImages(List<Uint8List> images, List<String> names) async {
    try {
      for (int i = 0; i < images.length; i++) {
        // Implement upload logic for Web images (e.g., upload to Supabase)
        // Example: await _appRepository.supabaseProvider.client.storage.from('wardrobe').uploadBinary(names[i], images[i]);
      }
    } catch (e) {
      throw Exception('Failed to upload web images: $e');
    }
  }
}
