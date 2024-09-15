import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/chips/choice_chip.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/texts/product_price_text.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/product/variation_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = VariationController.instance;
    return Obx(
      () => Column(
        children: [
          // *selected prices
          if (controller.selectedVariation.value.id.isNotEmpty)
            RoundedContainer(
              margin: const EdgeInsets.symmetric(vertical: CSizes.md),
              // height: 60,
              padding: const EdgeInsets.all(CSizes.md),
              backgroundColor: CHelperFunctions.isDarkMode(context)
                  ? CColors.darkGrey2.withOpacity(0.8)
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
                        width: CSizes.spaceBetweenItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Price',
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              const SizedBox(
                                width: CSizes.spaceBetweenItems / 2,
                              ),
                              // * if there is a sale put the price with line through
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              const SizedBox(
                                width: CSizes.spaceBetweenItems,
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
                                width: CSizes.spaceBetweenItems,
                              ),
                              Text(controller.variationStockStatus.value,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
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
            ),
          const SizedBox(
            height: CSizes.spaceBetweenItems,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) {
              // each attribute will be a column >> name , values <<
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeadingSection(
                      title: attribute.name ?? '', showActionButton: false),
                  const SizedBox(
                    height: CSizes.spaceBetweenItems,
                  ),
                  Obx(
                    () => Wrap(
                      spacing: 8,
                      children: attribute.values!.map((attributeValue) {
                        final isSelected =
                            controller.selectedAttributes[attribute.name] ==
                                attributeValue;
                        final isAvailable = controller
                            .getAttributesAvailabilityInVariation(
                                product.productVariations!, attribute.name!)
                            .contains(attributeValue);
                        return CChoiceChip(
                            text: attributeValue,
                            isSelected: isSelected,
                            onSelected: isAvailable
                                ? (selected) {
                                    if (selected == true &&
                                        isAvailable == true) {
                                      log('Before: ${controller.selectedAttributes}');
                                      controller.onAttributeSelected(product,
                                          attribute.name ?? '', attributeValue);
                                      log('After: ${controller.selectedAttributes}');
                                    }
                                  }
                                : null);
                      }).toList(),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
