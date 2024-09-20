import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/core/common/widgets/icons/circular_icon.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/core/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:store/core/common/widgets/texts/product_title.dart';
import 'package:store/core/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/core/common/widgets/texts/product_price_text.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import '../../../../../features/shop/controllers/product/product_controller.dart';
import 'favorite_icon.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final percentage =
        controller.getSalePercentage(product.price, product.salePrice);
    final isDark = AppHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        AppHelperFunctions.navigateToScreen(
            context,
            ProductDetailsScreen(
              product: product,
            ));
      },
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(2),
        //  margin: const EdgeInsets.only(bottom: CSizes.md),
        decoration: BoxDecoration(
          //boxShadow: [CShadowStyles.horizontalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: isDark ? AppColors.darkerGrey : AppColors.lightGrey,
        ),
        child: Row(
          children: [
            const SizedBox(width: 2),
            // * thumbnail image , sale , favorite icon
            RoundedContainer(
              padding: const EdgeInsets.all(AppSizes.md),
              //width: 120,
              backgroundColor: isDark ? AppColors.dark : AppColors.light,
              child: Stack(
                children: [
                  // * thumbnail image
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: RoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                      applyBorderRadius: true,
                    ),
                  ),
                  // * favorite icon
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CustomFavoriteIcon(
                      productId: product.id,
                    ),
                  ),

                  // * sale
                  if (percentage != '0')
                    Positioned(
                      top: 12,
                      // left: 5,
                      child: SaleContainer(
                        sale: percentage,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            // * product details
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: AppSizes.sm, left: AppSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductTitleText(
                            title: product.title,
                            textSize: TextSizes.medium,
                          ),
                          BrandTitleWithVerifiedIcon(
                            title: product.brand?.name ?? '',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ProductPriceText(
                              price: product.price.toString(), isLarge: false),
                        ),
                        AddToCartButton(
                          product: product,
                        ),
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
