import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/theme/custom_themes/appbar_theme.dart';
import 'package:store/core/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:store/core/utils/theme/custom_themes/check_box_theme.dart';
import 'package:store/core/utils/theme/custom_themes/choice_chip_theme.dart';
import 'package:store/core/utils/theme/custom_themes/text_field_theme.dart';
import 'package:store/core/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/elevated_btn_theme.dart';

class AppTheme {
  // -- this is a private constructor to avoid making instance from this class
  AppTheme._();

//* -- Light Theme for Whole App

  static ThemeData lightThemData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    dividerColor: AppColors.darkerGrey,
  );

//* -- Dark Theme for the whole app

  static ThemeData darkThemData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    dividerColor: AppColors.darkerGrey,
  );
}
