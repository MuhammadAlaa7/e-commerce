import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/images/custom_circular_image.dart';
import 'package:store/common/widgets/loaders/shimmer_effect.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class FeaturedBrandCard extends StatelessWidget {
  const FeaturedBrandCard({
    super.key,
    required this.brandTitle,
    this.brandImage,
    this.showBorder = false,
    this.productsCount = 0,
    this.onTap,
  });

  final String brandTitle;
  final String? brandImage;
  final bool showBorder;
  final int? productsCount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        showBorder: showBorder,
        borderColor: Colors.grey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(CSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * icon
            Flexible(
              child: brandImage == null
                  ? const Icon(Icons.error)
                  : CachedNetworkImage(
                      color: CHelperFunctions.isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                      imageUrl: brandImage!,
                      width: 40,
                      height: 40,

                      //   fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CustomShimmerEffect(
                        height: 30,
                        width: 30,
                        radius: 10,
                      ),
                    ),
            ),
            const SizedBox(
              width: CSizes.spaceBetweenItems / 2,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifiedIcon(
                    title: brandTitle,
                    textSize: TextSizes.large,
                    iconColor: CColors.primary,
                  ),
                  Text(
                    productsCount.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
