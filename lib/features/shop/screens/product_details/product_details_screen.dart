import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store/features/shop/controllers/product/variation_controller.dart';

import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:store/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:store/core/utils/constants/enums.dart';
import 'package:store/core/utils/constants/sizes.dart';
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
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          // to reset the selected attributes when switching between products to avoid conflict
          VariationController.instance.resetSelectedAttributes();
          log('reset >> ${VariationController.instance.selectedAttributes}');
        }
      },
      child: Scaffold(
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
                    // * product attributes
                    if (product.productType == ProductType.variable.name)
                      ProductAttributes(
                        product: product,
                      ),

                    const SizedBox(
                      height: AppSizes.spaceBetweenSections,
                    ),

                    // * checkout and reviews

                    CheckoutAndReviews(
                      product: product,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavAddToCart(
          product: product,
        ),
      ),
    );
  }
}
