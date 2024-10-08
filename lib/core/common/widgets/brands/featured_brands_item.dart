import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

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
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * icon
            Flexible(
              child: brandImage == null
                  ? const Icon(Icons.error)
                  : CachedNetworkImage(
                      color: AppHelperFunctions.isDarkMode(context)
                          ? Colors.white
                          : Colors.black,
                      imageUrl: brandImage!,
                      width: 50,
                      height: 50,

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
              width: AppSizes.spaceBetweenItems,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifiedIcon(
                    title: brandTitle,
                    textSize: TextSizes.large,
                    iconColor: AppColors.primary,
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
