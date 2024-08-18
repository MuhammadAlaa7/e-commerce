import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/app_bar/custom_tab_bar.dart';
import 'package:store/common/widgets/custom_shapes/containers/searched_container.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/common/widgets/brands/featured_brands_item.dart';
import 'package:store/features/shop/controllers/category/category_controller.dart';
import 'package:store/features/shop/screens/brands/all_brands_screen.dart';
import 'package:store/features/shop/screens/store/widgets/category_tap.dart';
import 'package:store/routes/app_routes.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';
import '../../controllers/brand/brand_controller.dart';
import 'widgets/store_app_bar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredCategories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: featuredCategories.length,
      child: Scaffold(
        appBar: storeAppBar(context),
        body: NestedScrollView(
          headerSliverBuilder: (_, isInnerBoxScrolled) {
            return [
              // * it is a fixed space to put widgets on it

              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: CHelperFunctions.screenHeight(context) * 0.5,
                backgroundColor: CHelperFunctions.isDarkMode(context)
                    ? CColors.dark
                    : CColors.light,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(CSizes.sm),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: CSizes.spaceBetweenSections,
                      ),
                      // * -- Search bar
                      const SearchContainer(
                        text: 'Search in store',
                        padding: EdgeInsets.zero,
                        showBackgroundColor: false,
                      ),
                      const SizedBox(
                        height: CSizes.spaceBetweenSections,
                      ),
                      // * Featured Brands
                      HeadingSection(
                        title: 'Featured Brands',
                        onPressed: () {
                          CHelperFunctions.goTo(
                            context,
                            const AllBrandsScreen(),
                          );
                        },
                      ),
                      const SizedBox(
                        height: CSizes.spaceBetweenSections / 2,
                      ),
                      Obx(
                        () => CustomGridView(
                            mainAxisExtent: 80,
                            mainAxisSpacing: CSizes.gridViewSpacing,
                            itemCount: brandController.featuredBrands.length,
                            itemBuilder: (_, index) {
                              return FeaturedBrandCard(
                                
                                brandId: brandController .featuredBrands[index].id,
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
          // * The View Of The Tab Bar Above
          body: TabBarView(
            children: featuredCategories
                .map((category) => CategoryTap(categoryTap: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
