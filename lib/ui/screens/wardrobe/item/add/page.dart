import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:openwardrobe/models/wardrobe_item.dart';
import 'package:openwardrobe/services/wardrobe_service.dart';
import 'package:openwardrobe/repositories/wardrobe_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateItemPage extends StatefulWidget {
  const CreateItemPage({Key? key}) : super(key: key);

  @override
  _CreateItemPageState createState() => _CreateItemPageState();
}

class _CreateItemPageState extends State<CreateItemPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _brand;
  String? _category;
  PlatformFile? _selectedFile;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  Future<void> _saveItem() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not logged in')),
        );
        return;
      }

      final newItem = WardrobeItem(
        id: 'unique_id', // Generate a unique ID for the item
        userId: userId,
        name: _name!,
        brandId: _brand,
        categoryId: _category,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSynced: true,
      );

      // Upload image if selected
      if (_selectedFile != null) {
        // Implement your image upload logic here
        // For example, using Supabase Storage:
        // final storageResponse = await Supabase.instance.client.storage
        //     .from('your_bucket')
        //     .upload('path/to/your/image.png', _selectedFile!.bytes);
        // newItem.imageUrl = storageResponse.data;
      }

      // Save the item to the database
      final wardrobeService = WardrobeService(WardrobeRepository());
      await wardrobeService.addWardrobeItem(newItem);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item added successfully')),
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Brand'),
                onSaved: (value) => _brand = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (value) => _category = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Select Image'),
              ),
              if (_selectedFile != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Selected file: ${_selectedFile!.name}'),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveItem,
                child: const Text('Save Item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}