import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:store/features/shop/controllers/product/variation_controller.dart';

import '../../models/product_model.dart';
import 'widget/bottom_nav_add_to_cart.dart';
import 'widget/product_details_section.dart';
import 'widget/product_image_slider.dart';

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
              // * product images  (Header)

              ProductImages(
                product: product,
              ),

              // * product details (body)

              ProductDetailsSection(product: product),
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
