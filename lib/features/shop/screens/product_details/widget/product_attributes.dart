import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controllers/product/product_variation_controller.dart';
import 'package:store/features/shop/models/product_model.dart';

import 'package:store/core/utils/constants/sizes.dart';

import 'attributes_selection.dart';
import 'variation_container.dart';

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

            // *[1] variation container
            const VariationContainer(),

          const SizedBox(
            height: AppSizes.spaceBetweenItems,
          ),

          // * [2] attributes selection section

          AttributesSelection(product: product),
        ],
      ),
    );
  }
}
