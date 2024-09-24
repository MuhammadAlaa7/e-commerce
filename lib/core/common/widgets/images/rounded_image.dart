import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';

/// A clickable image with rounded corners
class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyBorderRadius = true,
    this.borderColor = AppColors.lightGrey,
    this.fit = BoxFit.fill,
    this.isNetworkImage = false,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.borderRadius = AppSizes.md,
    this.borderThickness = 1,
  });

  final double? width;
  final double? height;
  final String imageUrl;
  final bool applyBorderRadius;
  final Color borderColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double borderRadius;
  final double borderThickness ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderThickness),
        ),
        child: ClipRRect(
          borderRadius: applyBorderRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, progress) =>
                      const CustomShimmerEffect(
                    height: 150,
                    width: double.infinity,
                  ),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
