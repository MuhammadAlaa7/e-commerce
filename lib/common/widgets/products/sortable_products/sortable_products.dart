import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/input_field/filter_input_field.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/features/shop/controllers/product/all_products_controller.dart';

import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/constants/sizes.dart';

import '../product_card/vertical_product_card.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts(
      {super.key, required this.products});
  final List<ProductModel> products;
 
  @override
  Widget build(BuildContext context) {
    
final controller = Get.put(AllProductsController());
controller.assignAllProducts(products); 
    return Column(
      children: [
        // * -- filter field or sorting field
        const FilterField(
          valuesList: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenSections,
        ),

        // * -- products list

        Obx(
          ()  {


            return CustomGridView(
            itemCount: controller.allProducts.length,
            itemBuilder: (_, index) => VerticalProductCard(
              product: controller.allProducts[index],
            ),
          );
          }
        ),
      ],
    );
  }
}
