// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_app/screens/splash_screen.dart';
import 'package:image_picker_app/views/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Image picker',
      home: SplashScreen(),
    );
  }
}
