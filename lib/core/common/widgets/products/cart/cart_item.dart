import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/core/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
          height: 60,
          width: 60,
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          backgroundColor: isDark ? AppColors.darkGrey : AppColors.lightGrey,
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
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: '${entryPair.value}  ',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
