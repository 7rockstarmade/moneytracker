import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color.fromARGB(255, 15, 51, 243);
  static const neutral = Color.fromARGB(255, 107, 117, 128);
  static const bluegradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromARGB(255, 14, 51, 243),
      Color.fromARGB(255, 47, 218, 255),
    ],
  );
}
