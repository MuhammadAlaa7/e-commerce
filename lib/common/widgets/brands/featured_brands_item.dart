import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/images/custom_circular_image.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class FeaturedBrandCard extends StatelessWidget {
  const FeaturedBrandCard({
    super.key,
    required this.brandTitle,
    required this.brandImage,
    this.showBorder = false,
    this.onTap,
  });

  final String brandTitle;
  final String brandImage;
  final bool showBorder;
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
              child: CustomCircularImage(
                image: brandImage,
                imageColor: CHelperFunctions.isDarkMode(context)
                    ? Colors.white
                    : Colors.black,
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
                    textSize: TextSize.large,
                    iconColor: CColors.primary,
                  ),
                  Text(
                    '260 Products',
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
