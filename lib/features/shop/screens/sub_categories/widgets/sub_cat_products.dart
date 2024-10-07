import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:store/core/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/screens/all_products/all_products_screen.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';

import '../../../models/product_model.dart';

class SubCategoryProducts extends StatelessWidget {
  const SubCategoryProducts({
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
                  Get.toNamed(AppRoutes.viewAllProducts, arguments: {
                    'title': subCategory.name,
                    'query': null,
                    'futureMethod': catController.fetchProductsForCategory(
                      subCategory.id,
                      // limit -1 means no limit
                      limit: -1,
                    ),
                  });
                },
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenItems,
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
                      width: AppSizes.sm,
                    );
                  },
                  itemCount: 4,
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections / 2,
              ),
            ],
          );
        });
  }
}
