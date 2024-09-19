import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/brands/featured_brands_item.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/brand/brand_controller.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            CSizes.md,
          ),
          child: Column(
            children: [
              const HeadingSection(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenItems,
              ),
              Obx(
                () {
                  if (controller.isLoading.value == true) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: CColors.primary,
                    ));
                  }
                  if (controller.allBrands.isEmpty == true) {
                    return const Text('No Brands Found');
                  } else {
                    return CustomGridView(
                      mainAxisExtent: 80,
                      mainAxisSpacing: CSizes.gridViewSpacing,
                      itemCount: controller.allBrands.length,
                      itemBuilder: (_, index) => FeaturedBrandCard(
                        onTap: () {
                          Get.toNamed(Routes.brandProducts,
                              arguments: controller.allBrands[index]);
                        },
                        showBorder: true,
                        productsCount:
                            controller.allBrands[index].productsCount,
                        brandTitle: controller.allBrands[index].name,
                        brandImage: controller.allBrands[index].image,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/* 
FeaturedBrandCard(
                                
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



                   FeaturedBrandCard(
                        onTap: () {
                          Get.toNamed(Routes.brandProducts);
                        },
                        showBorder: true,
                        brandTitle: controller.allBrands[index].name,
                        brandImage: controller.allBrands[index].image,
                        brandId : controller.allBrands[index].id,
                      ),           



 */