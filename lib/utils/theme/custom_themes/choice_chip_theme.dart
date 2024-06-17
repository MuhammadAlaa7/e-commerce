import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class CChipTheme {
  CChipTheme._();

  // light theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: CColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );

  // dark theme

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CColors.darkGrey2,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: CColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
