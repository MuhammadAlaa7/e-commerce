import 'package:flutter/material.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
          height: 60,
          width: 60,
          imageUrl: CImages.productImage55,
          backgroundColor: isDark ? CColors.darkGrey : CColors.lightGrey,
        ),
        const SizedBox(width: CSizes.md),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Nike'),
              //const SizedBox(height: CSizes.sm),
              Text(
                'Red Nike Shoes',
                maxLines: 1,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              // const SizedBox(height: CSizes.sm),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
