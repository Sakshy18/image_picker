import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PickImg extends StatefulWidget {
  const PickImg({Key? key}) : super(key: key);

  @override
  State<PickImg> createState() => _PickImgState();
}

class _PickImgState extends State<PickImg> {
  // This is the file that will be used to store the image
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      return;
    }

    final url = Uri.parse('https://codelime.in/api/remind-app-token');

    final request = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('image', _image!.path);

    request.files.add(file);

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      print('Image uploaded!');
    } else {
      print('Image upload failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('Image Picker',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ))),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              Center(
                // this button is used to open the image picker
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: _openImagePicker,
                  child: Text(
                    'Select An Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              // The picked image will be displayed here
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Color.fromARGB(85, 47, 47, 47),
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              )
            ]),
          ),
        ));
  }
}
