import 'dart:io';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  bool get isWeb => kIsWeb;

  List<File> _selectedImages = [];
  List<Uint8List> _selectedWebImages = [];
  List<String> _selectedWebNames = [];

  @override
  void initState() {
    super.initState();
    if (!isWeb) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;
    _controller = CameraController(cameras.first, ResolutionPreset.high, enableAudio: false);
    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }

  Future<void> _pickImage({bool fromGallery = false}) async {
    if (isWeb) {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true, // Allows multiple file selection
      );

      if (result != null && result.files.isNotEmpty) {
        for (var file in result.files) {
          if (file.bytes != null) {
            setState(() {
              _selectedWebImages.add(file.bytes!);
              _selectedWebNames.add(file.name);
            });
          }
        }
      }
    } else {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImages.add(File(pickedFile.path));
        });
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      if (isWeb) {
        _selectedWebImages.removeAt(index);
        _selectedWebNames.removeAt(index);
      } else {
        _selectedImages.removeAt(index);
      }
    });
  }

  Future<void> _confirmUpload() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Upload'),
          content: const Text('Are you sure you want to upload these wardrobe items?'),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _submitImages();
                context.pop();

              },
              child: const Text('Upload'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submitImages() async {
    if (isWeb) {
      for (int i = 0; i < _selectedWebImages.length; i++) {
        debugPrint("Uploading Web Image: ${_selectedWebNames[i]}, Size: ${_selectedWebImages[i].length} bytes");
        // TODO: Implement upload logic for Web images (e.g., upload to Supabase)
      }
    } else {
      for (var imageFile in _selectedImages) {
        debugPrint("Uploading Mobile Image: ${imageFile.path}");
        // TODO: Implement upload logic for Mobile images (e.g., upload to Supabase)
      }
    }
    // Clear images after upload
    setState(() {
      _selectedImages.clear();
      _selectedWebImages.clear();
      _selectedWebNames.clear();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Wardrobe Item'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop()
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _selectedImages.isNotEmpty || _selectedWebImages.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount: isWeb ? _selectedWebImages.length : _selectedImages.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: isWeb
                                    ? Image.memory(_selectedWebImages[index], fit: BoxFit.cover, width: double.infinity)
                                    : Image.file(_selectedImages[index], fit: BoxFit.cover, width: double.infinity),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  child: IconButton(
                                    icon: const Icon(Icons.close, color: Colors.white, size: 18),
                                    onPressed: () => _removeImage(index),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_upload, size: 80, color: Colors.grey),
                        SizedBox(height: 10),
                        Text("No images selected", style: TextStyle(fontSize: 16)),
                        Text("Choose an option below to add an item to your wardrobe"),
                      ],
                    ),
            ),
            const SizedBox(height: 20),
            if (isWeb)
              ElevatedButton.icon(
                onPressed: () => _pickImage(),
                icon: const Icon(Icons.upload),
                label: const Text('Select Images from Computer'),
              )
            else
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(fromGallery: true),
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Choose from Gallery'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Take a Photo'),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            if (_selectedImages.isNotEmpty || _selectedWebImages.isNotEmpty)
              ElevatedButton.icon(
                onPressed: _confirmUpload,
                icon: const Icon(Icons.cloud_upload),
                label: const Text('Submit to Wardrobe'),
              ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}