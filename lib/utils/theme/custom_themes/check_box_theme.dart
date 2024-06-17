import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class CCheckBoxTheme {
  CCheckBoxTheme._();
//* light check box theme

  static CheckboxThemeData lightCheckBoxTheme = const CheckboxThemeData(
    checkColor: MaterialStatePropertyAll(CColors.light),
    fillColor: MaterialStatePropertyAll(CColors.primary),
    
    side: BorderSide(color: CColors.primary),
  );

// * dark check box theme
  static CheckboxThemeData darkCheckBoxTheme = const CheckboxThemeData(
    checkColor: MaterialStatePropertyAll(CColors.light),
    fillColor: MaterialStatePropertyAll(CColors.primary),
     side: BorderSide(color: CColors.primary),
  );
}
