import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _imageFile;
  String _name = 'John Doe';
  String _email = 'johndoe@example.com';
  String _phone = '+123 456 7890';
  String _address = '1234 Elm Street, Springfield, USA';

  // Method to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        // _imageFile = File(ppickedFile.path);
      });
    }
  }

  // Method to edit profile info
  Future<void> _editProfile() async {
    // Placeholder for edit logic. Can navigate to a new screen or show a dialog.
    // Add input fields to allow user to edit profile details.
    // This function could show a dialog to edit the profile information.
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController(text: _name);
        final emailController = TextEditingController(text: _email);
        final phoneController = TextEditingController(text: _phone);
        final addressController = TextEditingController(text: _address);

        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _name = nameController.text;
                  _email = emailController.text;
                  _phone = phoneController.text;
                  _address = addressController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile image section
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : const AssetImage('assets/default_profile.png')
                            as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: _pickImage,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Profile name
              Text(
                _name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Edit profile button
              ElevatedButton.icon(
                onPressed: _editProfile,
                icon: const Icon(Icons.edit, size: 18),
                label: const Text("Edit Profile"),
              ),
              const SizedBox(height: 20),
              // Profile details section
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.email),
                  title: const Text("Email"),
                  subtitle: Text(_email),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text("Phone"),
                  subtitle: Text(_phone),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Address"),
                  subtitle: Text(_address),
                ),
              ),
              const SizedBox(height: 20),
              // Other actions
              ElevatedButton(
                onPressed: () {
                  // Add logout logic or any other actions
                  print('User logged out');
                },
                child: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                    // primary: Colors.red,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
