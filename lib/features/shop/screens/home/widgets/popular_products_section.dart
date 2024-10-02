import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:store/core/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/all_products/all_products_screen.dart';
import '../../../controllers/product/product_controller.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return Column(
      children: [
        HeadingSection(
          title: 'Popular Products',
          onPressed: () {
            Get.to(
              () => AllProductsScreen(
                title: 'Popular Products',
                query: FirebaseFirestore.instance
                    .collection('MyProducts')
                    .limit(10),
              ),
            );
          },
        ),
        Obx(
          () {
            if (controller.isLoading.value == true) {
              return const VerticalProductShimmer();
            }
            if (controller.featuredProducts.isEmpty == true) {
              return const Text('No Popular Products Found');
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
      ],
    );
  }
}
