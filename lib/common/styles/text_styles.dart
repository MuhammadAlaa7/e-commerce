import 'package:flutter/material.dart';

class CTextStyles {
  static TextStyle titleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }

  static TextStyle subTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

 static TextStyle buttonLabelTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }
  
}
