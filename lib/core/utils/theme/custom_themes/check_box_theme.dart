import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/colors.dart';

class CustomCheckBoxTheme {
  CustomCheckBoxTheme._();
//* light check box theme

  static CheckboxThemeData lightCheckBoxTheme = const CheckboxThemeData(
    checkColor: WidgetStatePropertyAll(AppColors.light),
    fillColor: WidgetStatePropertyAll(AppColors.primary),
    side: BorderSide(color: AppColors.primary),
  );

// * dark check box theme
  static CheckboxThemeData darkCheckBoxTheme = const CheckboxThemeData(
    checkColor: WidgetStatePropertyAll(AppColors.light),
    fillColor: WidgetStatePropertyAll(AppColors.primary),
    side: BorderSide(color: AppColors.primary),
  );
}
