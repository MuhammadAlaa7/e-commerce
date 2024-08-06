import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({
    super.key,
  });

// TODO: MAKE THIS WIDGET WITH DYNAMIC DATA

  @override
  Widget build(BuildContext context) {
    final bool isDark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        CHelperFunctions.goTo(context, const ProductDetailsScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(bottom: CSizes.md),
        decoration: BoxDecoration(
          //  boxShadow: [CShadowStyles.verticalProductShadow],
          borderRadius: BorderRadius.circular(CSizes.productImageRadius),
          color: isDark ? CColors.darkGrey2 : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * -- thumbnail image , sale , favorite icon

            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundColor:
                  isDark ? CColors.dark : CColors.lightProductThumbnailColor,
              child: const Stack(
                children: [
                  // * --  thumbnail image
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedImage(imageUrl: CImages.productImage66),
                  ),

                  // * -- sale
                  Positioned(
                    top: 12,
                    child: SaleContainer(
                      sale: 15,
                    ),
                  ),
                  // * -- favorite icon
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      iconColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            // * -- Details

            Padding(
              padding: const EdgeInsets.only(left: CSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: CSizes.spaceBetweenItems / 2),
                  // * Product name
                  Text(
                    'Red Nike shoes',
                    style: Theme.of(context).textTheme.titleSmall!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: CSizes.spaceBetweenItems / 2),

                  // * brand title with verified icon
                  const BrandTitleWithVerifiedIcon(
                      title: 'Nike Product', iconColor: CColors.primary),
                ],
              ),
            ),
            // * spacer for pushing the price and add button to the bottom of the card
            const Spacer(),

            // * -- price and add button
            Padding(
              padding: const EdgeInsets.only(left: CSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ 150.00',
                    style: Theme.of(context).textTheme.titleLarge!.apply(),
                  ),
                  const AddToCartButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
