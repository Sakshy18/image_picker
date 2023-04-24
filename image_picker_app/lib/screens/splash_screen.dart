// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:image_picker_app/screens/pick_screen.dart';
import 'package:image_picker_app/views/constants.dart';

import 'package:image_picker_app/main.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen()); // define it once at root level.
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PickImg(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.red,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              // padding: EdgeInsets.all(80),
              child: Text(
            "Welcome to Image Picker",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.bold),
          )),
        ));
  }
}
