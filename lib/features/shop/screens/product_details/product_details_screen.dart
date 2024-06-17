import 'package:flutter/material.dart';
import 'package:store/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:store/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:store/utils/constants/sizes.dart';
import 'widget/bottom_nav_add_to_cart.dart';
import 'widget/product_image_slider.dart';
import 'widget/product_meta_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CBottomNavAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // * product image  (Header)

            ProductImageSlider(),

            // * product details (body)

            Padding(
              padding: EdgeInsets.only(
                left: CSizes.defaultSpace,
                right: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * rating and share
                  RatingShareWidget(),
                  // * product meta data
                  ProductMetaData(),
                  // * product attributes
                  ProductAttributes(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
