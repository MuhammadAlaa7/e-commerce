import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controllers/product/product_variation_controller.dart';

import '../../models/product_model.dart';
import 'widget/bottom_nav_add_to_cart.dart';
import 'widget/product_details_section.dart';
import 'widget/product_images.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    
  });
  
  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductModel;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop , result) {
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
              // * [ 1 ] -- product images  (Header)

              ProductImages(
                product: product,
              ),

              // *   [ 2 ] -- product details (body)

              ProductDetailsSection(product: product),
            ],
          ),
        ),
         // * [ 3 ] -- bottom nav (footer)
        bottomNavigationBar: BottomNavAddToCart(
          product: product,
        ),
      ),
    );
  }
}
