import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/core/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import '../../texts/product_price_text.dart';
import 'add_remove_button.dart';

class SingleCartItem extends StatelessWidget {
  const SingleCartItem({
    super.key,
    required this.cartItem,
    required this.showButtonsAndPrice,
  });
  final bool showButtonsAndPrice;
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () async {
        // fetch the product you want to navigate to before navigating
        final product = await ProductController.instance
            .fetchProductById(cartItem.productId);

        Get.to(() => ProductDetailsScreen(product: product));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage(
            height: 60,
            width: 60,
            fit: BoxFit.contain,
            isNetworkImage: true,
            imageUrl: cartItem.image ?? '',
            backgroundColor:
                isDark ? AppColors.darkGrey : AppColors.lightContainer,
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
                //const SizedBox(height: CSizes.sm),
                Text(
                  cartItem.title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                // const SizedBox(height: CSizes.sm),
                Text.rich(
                  TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries // * entries here means all the keys and values pairs in the map
                        .map((entryPair) => TextSpan(
                              children: [
                                TextSpan(
                                    text: '${entryPair.key}: ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                TextSpan(
                                    text: '${entryPair.value}  ',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ))
                        .toList(),
                  ),
                ),

                if (showButtonsAndPrice)
                  const SizedBox(height: AppSizes.spaceBetweenItems),

                // * add and remove button and price
                if (showButtonsAndPrice)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ProductQuantityWithAddRemoveButton(
                            cartItem: cartItem,
                          ),
                        ],
                      ),
                      ProductPriceText(
                        price: (cartItem.price * cartItem.quantity).toString(),
                        isLarge: false,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.md),
        ],
      ),
    );
  }
}
