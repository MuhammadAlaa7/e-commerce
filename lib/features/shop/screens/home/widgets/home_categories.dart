import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/images_with_text/vertical_image_text.dart';
import 'package:store/core/common/widgets/shimmers/category_shimmer.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/core/routes/app_routes.dart';

class HomePopularCategories extends StatelessWidget {
  const HomePopularCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // put the categories controller in the getx system
    final categoriesController = CategoryController.instance;
    return

        // * popular categories
        Padding(
      padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
      child: Column(
        children: [
          // -- this is a custom header for any section in the app
          const HeadingSection(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          const SizedBox(height: AppSizes.spaceBetweenItems),
          // * home categories

          Obx(() {
            if (categoriesController.isLoading.value == true) {
              return const CustomCategoriesShimmer();
            }

            if (categoriesController.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  'No Popular Categories Found!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: Colors.white),
                ),
              );
            }

            return SizedBox(
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  final category =
                      categoriesController.featuredCategories[index];
                  return VerticalImageWithText(
                    isNetworkImage: true,
                    title: category.name,
                    image: category.image,
                    onTap: () {
                      Get.toNamed(AppRoutes.subCategories, arguments: category);
                    },
                  );
                },
                itemCount: categoriesController.featuredCategories.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}
