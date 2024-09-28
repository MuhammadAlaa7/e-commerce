import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/products/cart/add_to_cart_button.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';


class PriceAndAddButton extends StatelessWidget {
  const PriceAndAddButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return // * -- price and add button
        Padding(
      padding: const EdgeInsets.only(left: AppSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // to take all the available space in the row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * old price with line through
                if (product.productType == ProductType.single.name &&
                    product.salePrice > 0)
                  Text(
                    textAlign: TextAlign.left,
                    '\$ ${product.price}',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),

                Text(
                  '\$ ${controller.getProductPrice(product)}',
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: AppHelperFunctions.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.black,
                      ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          AddToCartButton(
            product: product,
          ),
        ],
      ),
    );
  }
}
