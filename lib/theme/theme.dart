import 'package:flutter/material.dart';

class FlutterRegulationTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 64,
        backgroundColor: Color(0xFFf4f5f7),
        shadowColor: Color(0xFFeff0f0),
        foregroundColor: Color(0XFF747E8B),
        titleTextStyle: TextStyle(
            color: Color(0XFF3E4D61),
            fontWeight: FontWeight.bold,
            fontSize: 18.0),
        toolbarTextStyle: TextStyle(
          color: Color(0XFF747E8B),
          fontSize: 16,
        ),
        iconTheme: IconThemeData(
          size: 27,
          color: Color(0XFF707783),
        ),
      ),
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
          bodyText2:
              TextStyle(color: Color(0xFF001a3b), fontFamily: 'Verdana')),
      iconTheme: IconThemeData(size: 20, color: Color(0XFF447FEB)),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      shadowColor: Color(0xFF353535),
      appBarTheme: const AppBarTheme(
          elevation: 64,
          color: Colors.black,
          shadowColor: Color(0xFF242424),
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
          toolbarTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          iconTheme: IconThemeData(
            size: 27,
            color: Colors.white,
          ),
          foregroundColor: Color(0XFF747E8B)),
      scaffoldBackgroundColor: Color(0xFF0b0b0b),
      textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0),
          headline2: TextStyle(
              color: Color(0xFFfdfdfd), backgroundColor: Color(0xFF272727)),
          bodyText1: TextStyle(
              color: Color(0xFF96a4b1),
              fontWeight: FontWeight.w600,
              fontFamily: 'Verdana'),
          bodyText2:
              TextStyle(color: Color(0xFF989898), fontFamily: 'Verdana')),
      iconTheme: IconThemeData(size: 20, color: Colors.white),
    );
  }
}
