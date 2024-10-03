
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/chips/choice_chip.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/shop/models/product_attributes_model.dart';

import '../../../controllers/product/product_variation_controller.dart';
import '../../../models/product_model.dart';

class AttributesSelection extends StatelessWidget {
  const AttributesSelection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.productAttributes!.map((attribute) {
        // each attribute will be a column >> name , values <<
        return AttributeItem(product: product, attribute: attribute);
      }).toList(),
    );
  }
}

class AttributeItem extends StatelessWidget {
  const AttributeItem({
    super.key,
    required this.product,
    required this.attribute,
  });

  final ProductModel product;
  final ProductAttributeModel attribute;

  @override
  Widget build(BuildContext context) {
    final controller = VariationController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingSection(title: attribute.name ?? '', showActionButton: false),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        Obx(
          // wrap is like the row but it's used with dynamic content ,
          //or unknown number of children , it handles the overflow by moving to the next line
          () => Wrap(
            spacing: 8,
            children: attribute.values.map((attributeValue) {
              final isSelected =
                  controller.selectedAttributes[attribute.name] ==
                      attributeValue;
              final isAvailable = controller
                  .getAttributesAvailabilityInVariation(
                      product.productVariations!, attribute.name)
                  .contains(attributeValue);

              return CustomChoiceChip(
                  text: attributeValue,
                  isSelected: isSelected,
                  onSelected: isAvailable
                      ? (selected) {
                          if (selected == true && isAvailable == true) {
                            controller.onAttributeSelected(
                                product, attribute.name ?? '', attributeValue);
                          }
                        }
                      : null);
            }).toList(),
          ),
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
      ],
    );
  }
}
