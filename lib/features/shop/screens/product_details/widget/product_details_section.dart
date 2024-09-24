import 'package:flutter/material.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:store/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'description_and_reviews.dart';
import 'product_meta_data.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSizes.defaultSpace,
        right: AppSizes.defaultSpace,
        bottom: AppSizes.defaultSpace,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * rating and share
          const RatingShareWidget(),

          // * product meta data
          ProductMetaData(product: product),

          // * product attributes [ variation container if it is variable product  , attributes selection ]
          if (product.productType == ProductType.variable.name)
            ProductAttributes(
              product: product,
            ),

          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          // * description and reviews

          DescriptionAndReviews(
            product: product,
          ),
        ],
      ),
    );
  }
}
