import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
Color kprimaryColor = Colors.red;
Color ksecondaryColor = Color(0xfffE3F0E2);

ThemeData aikyamTheme = ThemeData(
  // textTheme: GoogleFonts.poppinsTextTheme(),
  scaffoldBackgroundColor: ksecondaryColor,
  iconTheme: IconThemeData(color: Colors.red),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: kprimaryColor,
    secondary: ksecondaryColor,
  ),
);

TextStyle kTextPopB24 =
    GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.bold);
TextStyle kTextPopM16 =
    GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.w600);
