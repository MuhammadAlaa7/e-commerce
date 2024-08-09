import 'package:flutter/material.dart';
import 'package:store/common/widgets/input_field/filter_input_field.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/features/shop/controllers/product_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/constants/sizes.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            'Popularity',
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenSections,
        ),

        // * -- products list
        CustomGridView(
          itemCount: 8,
          itemBuilder: (_, index) =>  VerticalProductCard(product: ProductModel.empty(),),
        ),
      ],
    );
  }
}
