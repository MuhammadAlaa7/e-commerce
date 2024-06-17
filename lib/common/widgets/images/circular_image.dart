import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = CSizes.sm,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.imageColor,
    this.fit = BoxFit.cover,
  });
  final double width, height, padding;
  final String image;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? imageColor;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (CHelperFunctions.isDarkMode(context)
                ? CColors.dark
                : CColors.light),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        fit: fit,
        color: imageColor,
      ),
    );
  }
}
