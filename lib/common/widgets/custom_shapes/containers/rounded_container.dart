import 'package:flutter/material.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.showBorder = false,
    this.radius = CSizes.cardRadiusLg,
    this.padding,
    this.margin,
    this.child,
  });

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool showBorder;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder
            ? Border.all(
                color: borderColor ??
                    (CHelperFunctions.isDarkMode(context)
                        ? CColors.darkGrey
                        : Colors.grey))
            : null,
      ),
      child: child,
    );
  }
}
