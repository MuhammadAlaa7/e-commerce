import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = 0,
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
            (AppHelperFunctions.isDarkMode(context)
                ? AppColors.dark
                : AppColors.light),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: imageColor,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, progress) =>
                    const CustomShimmerEffect(
                  height: 56,
                  width: 56,
                  radius: 100,
                ),
              )
            : Image(
                image: AssetImage(image),
                fit: fit,
                color: imageColor,
              ),
      ),
    );
  }
}
