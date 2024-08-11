import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:store/common/widgets/texts/product_title.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/common/widgets/texts/product_price_text.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        CHelperFunctions.goTo(context,  ProductDetailsScreen( product: ProductModel.empty(),));
      },
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(2),
        //  margin: const EdgeInsets.only(bottom: CSizes.md),
        decoration: BoxDecoration(
          //boxShadow: [CShadowStyles.horizontalProductShadow],
          borderRadius: BorderRadius.circular(CSizes.productImageRadius),
          color: isDark ? CColors.darkGrey2 : CColors.lightContainer,
        ),
        child: Row(
          children: [
            const SizedBox(width: 2),
            // * thumbnail image , sale , favorite icon
            RoundedContainer( 
              padding: const EdgeInsets.all(CSizes.md),
              //width: 120,
              backgroundColor: isDark ? CColors.dark : CColors.light,
              child: const Stack(
                children: [
                  // * thumbnail image
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: RoundedImage(
                      imageUrl: CImages.slipper_product_1,
                      // width: 100,
                      // height: 100,
                    ),
                  ),
                  // * favorite icon
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      iconColor: Colors.red,
                    ),
                  ),

                  // * sale
                  Positioned(
                    top: 12,
                    // left: 5,
                    child: SaleContainer(
                      sale: '25',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: CSizes.sm),
            // * product details
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: CSizes.sm, left: CSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleText(
                            title: 'Nike Air Jordan shoes',
                            textSize: TextSizes.medium,
                          ),
                          BrandTitleWithVerifiedIcon(
                            title: 'Nike',
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ProductPriceText(price: '250', isLarge: false),
                        ),
                        AddToCartButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
