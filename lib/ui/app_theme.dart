import 'package:flutter/material.dart';

// class AppTheme {
//   static ThemeData get data {
//     return ThemeData(
//       scaffoldBackgroundColor: Colors.white,
//       appBarTheme: appBarTheme(),
//       textTheme: textTheme(),
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//     );
//   }
//
//   static TextTheme textTheme() {
//     return TextTheme(
//       bodyText1: TextStyle(color: Color(0xFF757575)),
//       bodyText2: TextStyle(color: Color(0xFF757575)),
//     );
//   }
//
//   static AppBarTheme appBarTheme() {
//     return AppBarTheme(
//       color: Colors.white,
//       elevation: 0,
//       brightness: Brightness.light,
//       iconTheme: IconThemeData(color: Colors.black),
//       textTheme: TextTheme(
//         headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
//       ),
//     );
//   }
// }

class AppTheme {
  static ThemeData get data {
    return ThemeData(
      textTheme: TextTheme(
        title: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
        subtitle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
