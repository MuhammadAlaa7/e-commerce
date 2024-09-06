import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/common/widgets/loaders/horizontal_product_shimmer.dart';
import 'package:store/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/banner/banner_controller.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/screens/all_products/all_products_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/cloud_helper_functions.dart';

import '../../models/product_model.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // receive the arguments from previous screen
    final CategoryModel category = Get.arguments as CategoryModel;
    final catController = CategoryController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.md),
          child: Column(
            children: [
              // * banner section
              const RoundedImage(imageUrl: CImages.banner1),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),

              FutureBuilder(
                  // fetch sub categories for the main category id
                  future:
                      catController.fetchSubCategoriesForCategory(category.id),
                  builder: (_, snapshot) {
                    const loader = HorizontalProductShimmer();

                    /// widget here will be loading or error or data widget
                    final widget =
                        CustomCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // data found
                    final subCategories = snapshot.data as List<CategoryModel>;
                    return ListView.builder(
                        itemCount: subCategories.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          // get sub category
                          final subCategory = subCategories[index];
                          return SubCategoryItem(
                            subCategory: subCategory,
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    super.key,
    required this.subCategory,
  });

  final CategoryModel subCategory;
  @override
  Widget build(BuildContext context) {
    final catController = CategoryController.instance;
    return FutureBuilder(
        future:
            catController.fetchProductsForCategory(subCategory.id, limit: 4),
        builder: (_, snapshot) {
          log(subCategory.id);
          const loader = HorizontalProductShimmer();
          final widget = CustomCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          // data found
          final products = snapshot.data as List<ProductModel>;
          return Column(
            children: [
              // * Banner Section

              //  * sub categories section
              HeadingSection(
                title: subCategory.name,
                onPressed: () {
                  Get.to(
                    () => AllProductsScreen(
                        title: subCategory.name,
                        futureMethod: catController.fetchProductsForCategory(
                          subCategory.id,
                          // limit -1 means no limit
                          limit: -1,
                        )),
                  );
                },
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    final product = products[index];
                    return HorizontalProductCard(
                      product: product,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      width: CSizes.sm,
                    );
                  },
                  itemCount: 4,
                ),
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections / 2,
              ),
            ],
          );
        });
  }
}
