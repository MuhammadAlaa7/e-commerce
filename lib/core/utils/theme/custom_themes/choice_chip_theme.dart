import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/colors.dart';

class CustomChipTheme {
  CustomChipTheme._();

  // light theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );

  // dark theme

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: AppColors.darkerGrey,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
