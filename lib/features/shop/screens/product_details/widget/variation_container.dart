import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/common/widgets/texts/product_price_text.dart';
import 'package:store/features/shop/controllers/product/variation_controller.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class VariationContainer extends StatelessWidget {
  const VariationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = VariationController.instance;
    return RoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.md),
      // height: 60,
      padding: const EdgeInsets.all(AppSizes.md),
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.darkerGrey.withOpacity(0.8)
          : Colors.grey.withOpacity(0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Variation:  ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                width: AppSizes.spaceBetweenItems,
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Price',
                          style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(
                        width: AppSizes.spaceBetweenItems / 2,
                      ),
                      // * if there is a sale put the price with line through
                      if (controller.selectedVariation.value.salePrice > 0)
                        Text(
                          '\$${controller.selectedVariation.value.price}',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                decoration: TextDecoration.lineThrough,
                              ),
                        ),
                      const SizedBox(
                        width: AppSizes.spaceBetweenItems,
                      ),
                      const ProductPriceText(
                        price: '134,00',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Stock',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(
                        width: AppSizes.spaceBetweenItems,
                      ),
                      Text(controller.variationStockStatus.value,
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            controller.selectedVariation.value.description ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
