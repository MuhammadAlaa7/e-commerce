import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/loaders/verticatl_product_shimmer.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/utils/constants/sizes.dart';

import '../../controllers/product/product_controller.dart';
import 'widgets/wishlist_app_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final controller = ProductController.instance;

    return Scaffold(
      appBar: const WishlistAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.sm),
          child:    Obx(
            () {
              if (controller.isLoading.value == true) {
                return const VerticalProductShimmer();
              }
              if (controller.featuredProducts.isEmpty == true) {
                return const Text('No Products Found');
              } else {
                return CustomGridView(
                  itemCount: 4,
                  itemBuilder: (_, index) => VerticalProductCard(
                    product: controller.featuredProducts[index],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
