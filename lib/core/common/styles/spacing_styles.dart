import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: kToolbarHeight,
    left: AppSizes.defaultSpace,
    right: AppSizes.defaultSpace,
    bottom: AppSizes.defaultSpace,
  );
}
