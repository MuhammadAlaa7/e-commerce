import 'package:flutter/material.dart';
import 'package:store/utils/constants/sizes.dart';

class CSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: kToolbarHeight,
    left: CSizes.defaultSpace,
    right: CSizes.defaultSpace,
    bottom: CSizes.defaultSpace,
  );
}
