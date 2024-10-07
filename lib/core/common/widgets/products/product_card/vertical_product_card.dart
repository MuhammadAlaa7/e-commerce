import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/core/common/widgets/products/product_card/favorite_icon.dart';
import 'package:store/core/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/core/common/widgets/texts/price_and_add_button.dart';
import 'package:store/core/common/widgets/texts/product_title.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    /// -- variables
    final controller = ProductController.instance;
    final percentage =
        controller.getSalePercentage(product.price, product.salePrice);
    final bool isDark = AppHelperFunctions.isDarkMode(context);

    /// -- widget
    return GestureDetector(
      onTap: () {
       Get.toNamed(AppRoutes.productDetails, arguments: product);
      },
      // * main image container
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          //  boxShadow: [CShadowStyles.verticalProductShadow],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: isDark ? AppColors.darkerGrey : AppColors.light,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * -- thumbnail image , sale , favorite icon

            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AppSizes.sm),
              backgroundColor: isDark ? AppColors.dark : AppColors.lightGrey,
              child: Stack(
                children: [
                  // * --  thumbnail image
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedImage(
                      applyBorderRadius: false,
                      borderColor: Colors.transparent,
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                    ),
                  ),

                  // * -- sale
                  if (percentage != '0')
                    Positioned(
                      top: 5,
                      child: SaleContainer(
                        sale: percentage,
                      ),
                    ),
                  // * -- favorite icon
                  Positioned(
                    right: 0,
                    top: 5,
                    child: CustomFavoriteIcon(
                      height: 32,
                      width: 32,
                      iconSize: AppSizes.iconSm,
                      productId: product.id,
                    ),
                  ),
                ],
              ),
            ),

            // * -- Details

            // *[1] title and brand texts
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.spaceBetweenItems / 2),

                  ProductTitleText(
                    title: product.title,
                    textSize: TextSizes.medium,
                  ),

                  const SizedBox(height: AppSizes.spaceBetweenItems / 2),

                  // * brand title with verified icon
                  BrandTitleWithVerifiedIcon(
                      title: product.brand?.name ?? '',
                      iconColor: AppColors.primary),
                ],
              ),
            ),

            // * spacer for pushing the price and add button to the bottom of the card
                 const Spacer(),

            // * -- price and add button
            PriceAndAddButton(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
