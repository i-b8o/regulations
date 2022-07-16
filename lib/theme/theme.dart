import 'package:flutter/material.dart';

class FlutterRegulationTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color(0xFFFDFDFD),
      ),
        primaryColor: Color(0xFF2F7BF9),
        appBarTheme: const AppBarTheme(
            color: Color(0xFFFDFDFD), foregroundColor: Color(0XFF747E8B)),
        scaffoldBackgroundColor: Colors.white);
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFFFDFDFD),
      ),
    );
  }
}
