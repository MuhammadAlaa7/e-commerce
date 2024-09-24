import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.iconColor,
    required this.icon,
    this.onPressed,
    this.size = AppSizes.iconMd,
  });

  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (isDark
                ? Colors.grey.withOpacity(0.4)
                : Colors.grey.withOpacity(0.4)),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
