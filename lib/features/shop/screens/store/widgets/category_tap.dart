import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:store/core/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/screens/all_products/all_products_screen.dart';
import 'package:store/features/shop/screens/store/widgets/category_brands.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CategoryTap extends StatelessWidget {
  const CategoryTap({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Column(
            children: [
              // * category brands show cases for all brands in that category
              CategoryBrandsSection(
                category: category,
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections),
              // * all category Products
              FutureBuilder(
                future: CategoryController.instance
                    .fetchProductsForCategory(category.id, limit: -1),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const VerticalProductShimmer();
                  }

                  if (snapshot.data == null ||
                      snapshot.data!.isEmpty ||
                      snapshot.hasError) {
                    return const Center(child: Text('No Products Found'));
                  }
                  return Column(
                    children: [
                      HeadingSection(
                        title: 'You might like ',
                        onPressed: () {
                          Get.to(
                            () => AllProductsScreen(
                                title: category.name,
                                query: FirebaseFirestore.instance
                                    .collection('MyProducts')
                                    .where('categoryId',
                                        isEqualTo: category.id)),
                          );
                        },
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenSections),
                      CustomGridView(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (_, index) => VerticalProductCard(
                          product: snapshot.data![index],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
