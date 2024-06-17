import 'package:flutter/material.dart';

class CColors {
  CColors._();

// -- app basic colors

  static const Color primary = Color(0xff4b68ff);
  static const Color secondary = Color(0xffffe24b);
  static const Color accent = Color(0xffb0c7ff);

// -- text colors

  static const Color textPrimary = Color(0xff333333);
  static const Color textSecondary = Color(0xff6c757d);
  static const Color textWhite = Colors.white;

// -- borders colors

  static Color borderPrimary = Colors.grey.withOpacity(0.5);

  // -- background colors
  static const Color light = Color.fromARGB(255, 236, 233, 233);
  static const Color dark = Color(0xff100c08);
  //static const Color dark = Color.fromARGB(255, 21, 21, 21);
  static const Color primaryBackground = Color(0xfff3f5ff);
  static const Color darkGrey = Color(0xff5A5A5A);
  static const Color darkGrey2 = Color(0xff504A4B);
  static Color lightGrey = Colors.grey.withOpacity(0.1);
  static const Color lightDark = Color.fromARGB(255, 50, 48, 48);
  static const Color lightProductThumbnailColor =
      Color.fromARGB(255, 235, 232, 232);

// -- background container colors

  static const Color lightContainer = Color(0xfff6f6f6);
  // static Color darkContainer = Colors.white.withOpacity(0.1);

// --button colors

  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondary = Color(0xff6c757d);
  static const Color buttonDisabled = Color(0xffc4c4c4);
}
