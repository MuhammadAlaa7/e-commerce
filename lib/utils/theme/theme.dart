import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/theme/custom_themes/appbar_theme.dart';
import 'package:store/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:store/utils/theme/custom_themes/check_box_theme.dart';
import 'package:store/utils/theme/custom_themes/choice_chip_theme.dart';
import 'package:store/utils/theme/custom_themes/text_field_theme.dart';
import 'package:store/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/elevated_btn_theme.dart';

class CAppTheme {
  // -- this is a private constructor to avoid making instance from this class
  CAppTheme._();

//* -- Light Theme for Whole App

  static ThemeData lightThemData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: CColors.light,
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
    checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: CChipTheme.lightChipTheme,
  );

//* -- Dark Theme for the whole app

  static ThemeData darkThemData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: CColors.dark,
    textTheme: CTextTheme.darkTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: CTextFieldTheme.darkInputDecorationTheme,
    checkboxTheme: CCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: CChipTheme.darkChipTheme,
  );
}
