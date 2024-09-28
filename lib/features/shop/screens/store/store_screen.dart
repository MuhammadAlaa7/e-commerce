import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:store/core/common/widgets/app_bar/custom_tab_bar.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/searched_container.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/common/widgets/brands/featured_brands_item.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/screens/brands/all_brands_screen.dart';
import 'package:store/features/shop/screens/store/widgets/category_tap.dart';
import 'package:store/core/routes/routes.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';
import '../../controllers/brand/brand_controller.dart';
import 'widgets/store_app_bar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredCategories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return Scaffold(
      appBar: storeAppBar(context),
      body: DefaultTabController(
        //* it is a must to provide a controller above the tab bar to manage the tabs and their views
        length: featuredCategories.length,
        child: NestedScrollView(
          headerSliverBuilder: (_, isInnerBoxScrolled) {
            return [
              // * it is a fixed space to put widgets on it

              //* [1] -- the sliver app bar
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: AppHelperFunctions.screenHeight() * 0.6,
                backgroundColor: AppHelperFunctions.isDarkMode(context)
                    ? AppColors.dark
                    : AppColors.light,
                // a space to put widgets into it [ content ]
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AppSizes.sm),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // * -- Search bar
                      const SearchContainer(
                        text: 'Search in store',
                        margin: EdgeInsets.only(top: 10),
                        showBackgroundColor: false,
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBetweenItems,
                      ),
                      // * Featured Brands
                      HeadingSection(
                        title: 'Featured Brands',
                        onPressed: () {
                          Get.to(() => const AllBrandsScreen());
                        },
                      ),
                      const SizedBox(
                        height: AppSizes.spaceBetweenSections / 2,
                      ),
                      Obx(
                        () => CustomGridView(
                            mainAxisExtent: 80,
                            mainAxisSpacing: AppSizes.gridViewSpacing,
                            itemCount: brandController.featuredBrands.length,
                            itemBuilder: (_, index) {
                              return FeaturedBrandCard(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.brandProducts,
                                    arguments:
                                        brandController.featuredBrands[index],
                                  );
                                },
                                brandTitle:
                                    brandController.featuredBrands[index].name,
                                brandImage:
                                    brandController.featuredBrands[index].image,
                                showBorder: true,
                                productsCount: brandController
                                    .featuredBrands[index].productsCount,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                bottom: CustomTapBar(
                  tabs: featuredCategories
                      .map((category) => Tab(
                            text: category.name,
                          ))
                      .toList(),
                ),
              ),
            ];
          },
          //* [2] -- the tab bar
          // * The View Of The Tab Bar Above [ this is a page view ]
          body: TabBarView(
            children: featuredCategories
                .map((category) => CategoryTap(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
