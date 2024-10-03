import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/brands/featured_brands_item.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/core/common/widgets/shimmers/brands/all_brands_shimmer.dart';
import 'package:store/features/shop/controllers/brand/brand_controller.dart';
import 'package:store/core/routes/routes.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/shop/models/brand_model.dart';

import '../../../../core/utils/helper/cloud_helper_functions.dart';

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
            AppSizes.md,
          ),
          child: FutureBuilder(
              future: controller.fetchAllBrands(),
              builder: (context, snapshot) {
                const loader = AllBrandsShimmer();

                final widget = CustomCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                );

                if (widget != null) return widget;

                final allBrands = snapshot.data as List<BrandModel>;
                return CustomGridView(
                  mainAxisExtent: 80,
                  mainAxisSpacing: AppSizes.gridViewSpacing,
                  itemCount: allBrands.length,
                  itemBuilder: (_, index) => FeaturedBrandCard(
                    onTap: () {
                      Get.toNamed(Routes.brandProducts,
                          arguments: allBrands[index]);
                    },
                    showBorder: true,
                    productsCount: allBrands[index].productsCount,
                    brandTitle: allBrands[index].name,
                    brandImage: allBrands[index].image,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
