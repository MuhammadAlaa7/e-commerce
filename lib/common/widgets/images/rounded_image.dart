import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyBorderRadius = true,
    this.border,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.borderRadius = CSizes.md,
  });

  final double? width;
  final double? height;
  final String imageUrl;
  final bool applyBorderRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double borderRadius;
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
          border: border,
        ),
        child: ClipRRect(
          borderRadius: applyBorderRadius
              ? BorderRadius.circular(CSizes.md)
              : BorderRadius.zero,
         child: imageUrl.isNotEmpty ? isNetworkImage 
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                 fit: BoxFit.contain,
              
                errorWidget: (context, url, error) => const Icon(Icons.error),
             
                
                progressIndicatorBuilder: (context, url, progress) =>
                      const CustomShimmerEffect(
                    height: 150,
                    width: double.infinity,
                  
                  ),
              )
            : Image(
                image: AssetImage(imageUrl),
               fit: BoxFit.contain,
              
              ) : Icon(Icons.error , size: 30,),
        ),
      ),
    );
  }
}
