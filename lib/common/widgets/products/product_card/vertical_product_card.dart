import 'package:flutter/material.dart';
import 'package:store/common/widgets/custom_shapes/containers/sale_container.dart';
import 'package:store/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:store/common/widgets/products/product_card/favorite_icon.dart';
import 'package:store/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/common/widgets/texts/product_title.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

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
    final controller = ProductController.instance;
    final percentage =
        controller.getSalePercentage(product.price, product.salePrice);
    final bool isDark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        CHelperFunctions.navigateToScreen(
            context,
            ProductDetailsScreen(
              product: product,
            ));
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
              child: Stack(
                children: [
                  // * --  thumbnail image
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedImage(
                      imageUrl: product.thumbnail,
                      isNetworkImage: true,
                    ),
                  ),

                  // * -- sale
                  if (percentage != '0')
                    Positioned(
                      top: 12,
                      child: SaleContainer(
                        sale: percentage,
                      ),
                    ),
                  // * -- favorite icon
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CustomFavoriteIcon(
                      productId: product.id,
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
                  // * Product title
                  ProductTitleText(
                      title: product.title, textSize: TextSizes.small),

                  const SizedBox(height: CSizes.spaceBetweenItems / 2),

                  // * brand title with verified icon
                  BrandTitleWithVerifiedIcon(
                      title: product.brand?.name ?? '', iconColor: CColors.primary),
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
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // * old price with line through
                        if (product.productType == ProductType.single.name &&
                            product.salePrice > 0)
                          Text(
                            textAlign: TextAlign.left,
                            '\$ ${product.price}',
                            style:
                                Theme.of(context).textTheme.labelMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),

                        Text(
                          '\$ ${controller.getProductPrice(product)}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(fontWeightDelta: 1),
                        ),
                      ],
                    ),
                  ),
                   AddToCartButton(product: product,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
