import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CustomShimmerEffect extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final double radius;

  const CustomShimmerEffect({
    required this.height,
    required this.width,
    this.color,
    this.radius = 15,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? (isDark ? Colors.grey[800]! : Colors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
