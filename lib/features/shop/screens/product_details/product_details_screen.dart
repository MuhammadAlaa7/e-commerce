import 'package:flutter/material.dart';

import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:store/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'widget/bottom_nav_add_to_cart.dart';
import 'widget/checkout_and_rating.dart';
import 'widget/product_image_slider.dart';
import 'widget/product_meta_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CBottomNavAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * product image  (Header)

            ProductImageSlider(
              product: product,
            ),

            // * product details (body)

            Padding(
              padding: const EdgeInsets.only(
                left: CSizes.defaultSpace,
                right: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * rating and share
                  const RatingShareWidget(),
                  // * product meta data
                  ProductMetaData(product: product),
                  // * product attributes
                  if (product.productType == ProductType.variable.name)
                    ProductAttributes(
                      product: product,
                    ),

                  const SizedBox(
                    height: CSizes.spaceBetweenSections,
                  ),

                  // * checkout and reviews

                  const CheckoutAndReviews(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
