import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/brands/brand_show_case.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/loaders/verticatl_product_shimmer.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/product/product_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class CategoryTap extends StatelessWidget {
  const CategoryTap({
    super.key,
    required this.categoryTap,
  });
  final CategoryModel categoryTap;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CSizes.sm),
          child: Column(
            children: [
              // * Brands
              const BrandShowCase(
                images: [
                  CImages.leather_jacket_3,
                  CImages.nikeBasketballShoeGreenBlack,
                  CImages.baseball_bat,
                ],
              ),
              const SizedBox(height: CSizes.spaceBetweenSections),
              // * Products
              HeadingSection(
                title: 'You might like ',
                onPressed: () {},
              ),

              const SizedBox(height: CSizes.spaceBetweenSections),
              Obx(
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
            ],
          ),
        ),
      ],
    );
  }
}
