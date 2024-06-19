import 'package:flutter/material.dart';
import 'package:soundhub/data_providers/firestore_album_data_provider.dart';
import 'package:soundhub/models/album.dart';

class AddAlbumPage extends StatefulWidget {
  const AddAlbumPage({super.key});

  @override
  State<AddAlbumPage> createState() => _AddAlbumPageState();
}

class _AddAlbumPageState extends State<AddAlbumPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _artistIdController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  FirestoreAlbumDataProvider _dataProvider = FirestoreAlbumDataProvider();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Album album = Album(
        name: _nameController.text.trim(),
        genre: _genreController.text.trim(),
        year: int.parse(_yearController.text.trim()),
        artistId: _artistIdController.text.trim(),
        imageUrl: _imageUrlController.text.trim(),
      );

      try {
        await _dataProvider.addAlbum(album);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Album added successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add album: $e')),
        );
      }

      // Optionally, you can show a success message or navigate to another page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Album added successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Album'),
      ),  
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Album Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter album name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(labelText: 'Genre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter genre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter year';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid year';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _artistIdController,
                decoration: InputDecoration(labelText: 'Artist ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter artist ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Album'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genreController.dispose();
    _yearController.dispose();
    _artistIdController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }
}