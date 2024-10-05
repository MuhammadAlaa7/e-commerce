import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/brands/featured_brands_item.dart';
import 'package:store/core/common/widgets/shimmers/brands/featured_brands_shimmer.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/cloud_helper_functions.dart';
import 'package:store/features/shop/models/brand_model.dart';

import '../../../controllers/brand/brand_controller.dart';
import '../../brands/all_brands_screen.dart';

class StoreFeaturedBrands extends StatelessWidget {
  const StoreFeaturedBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());

    return FutureBuilder(
        future: brandController.fetchFeaturedBrands(),
        builder: (context, snapshot) {
          const loader = FeaturedBrandsShimmer();

          final widget = CustomCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot,
            loader: loader,
          );

          if (widget != null) return widget;

          final featuredBrands = snapshot.data as List<BrandModel>;
          return Column(
            children: [
              HeadingSection(
                title: 'Featured Brands',
                onPressed: () {
                  Get.to(
                    () => const AllBrandsScreen(),
                  );
                },
              ),
              const SizedBox(
                height: AppSizes.spaceBetweenSections / 2,
              ),
              //

              CustomGridView(
                  mainAxisExtent: 80,
                  mainAxisSpacing: AppSizes.gridViewSpacing,
                  itemCount: featuredBrands.length,
                  itemBuilder: (_, index) {
                    return FeaturedBrandCard(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.brandProducts,
                          arguments: featuredBrands[index],
                        );
                      },
                      brandTitle: featuredBrands[index].name,
                      brandImage: featuredBrands[index].image,
                      showBorder: true,
                      productsCount: featuredBrands[index].productsCount,
                    );
                  }),
            ],
          );
        });
  }
}
