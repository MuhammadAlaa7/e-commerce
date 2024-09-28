import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/images/rounded_image.dart';
import 'package:store/core/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';
import 'widgets/sub_cat_products.dart';

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
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              // * banner section
              const RoundedImage(imageUrl: AppImages.banner1),
              const SizedBox(
                height: AppSizes.spaceBetweenSections,
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
                          return SubCategoryProducts(
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
