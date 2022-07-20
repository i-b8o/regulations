import 'package:flutter/material.dart';

class FlutterRegulationTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 64,
          titleTextStyle: TextStyle(
              color: Color(0XFF3E4D61),
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          toolbarTextStyle: TextStyle(
            color: Color(0XFF747E8B),
            fontSize: 16,
          ),
          shadowColor: Color(0xFFeff0f0),
          // shadowColor: Colors.red,
          color: Color(0xFFf4f5f7),
          iconTheme: IconThemeData(
            size: 27,
            color: Color(0XFF707783),
          ),
          foregroundColor: Color(0XFF747E8B)),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xFF001a3b),
            fontWeight: FontWeight.bold,
            fontSize: 17.0),
        bodyText1: TextStyle(
            color: Color(0XFF3B4C61),
            fontWeight: FontWeight.w600,
            fontFamily: 'Verdana'),
          bodyText2: TextStyle(color: Color(0xFF001a3b),fontFamily: 'Verdana')
      ),
      iconTheme: IconThemeData(size: 20, color: Color(0XFF447FEB)),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 64,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          toolbarTextStyle: TextStyle(
            color: Color(0XFF1a415a),
            fontSize: 16,
          ),
          shadowColor: Color(0xFFeff0f0),
          // shadowColor: Colors.red,
          color: Color(0xFFf4f5f7),
          iconTheme: IconThemeData(
            size: 27,
            color: Color(0XFF707783),
          ),
          foregroundColor: Color(0XFF747E8B)),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xFF001a3b),
            fontWeight: FontWeight.bold,
            fontSize: 17.0),
        bodyText1: TextStyle(
            color: Color(0XFF3B4C61),
            fontWeight: FontWeight.w600,
            fontFamily: 'Verdana'),
          bodyText2: TextStyle(color: Color(0xFF001a3b),fontFamily: 'Verdana')
      ),
      iconTheme: IconThemeData(size: 20, color: Colors.white),
    );
  }
}
