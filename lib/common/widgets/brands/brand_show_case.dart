import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/brands/featured_brands_item.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/images/custom_circular_image.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class BrandShowCaseCard extends StatelessWidget {
  const BrandShowCaseCard({
    super.key,
    required this.images,
    required this.brand,
  });
  final List<String> images;
  final BrandModel brand;

  Widget brandTopProductImageWidget(BuildContext context, String image) {
    return RoundedContainer(
      height: 100,
      width: 100,
      margin: const EdgeInsets.only(right: CSizes.sm),
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: CHelperFunctions.isDarkMode(context)
          ? CColors.darkGrey
          : CColors.lightGrey,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            const CustomShimmerEffect(height: 100, width: 100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: CSizes.spaceBetweenItems),
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: Colors.transparent,
      borderColor: CColors.darkGrey2,
      showBorder: true,
      child: Column(
        //    mainAxisSize: MainAxisSize.min,
        children: [
          // * Brand with product count
          FeaturedBrandCard(
            brandTitle: brand.name,
            brandImage: brand.image,
            productsCount: brand.productsCount,
          ),

          // * Brand Top Three Products Images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: images
                .map((image) => brandTopProductImageWidget(context, image))
                .toList(),
          ),
        ],
      ),
    );
  }
}
