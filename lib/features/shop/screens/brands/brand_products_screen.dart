import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/brands/featured_brands_item.dart';
import 'package:store/core/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';

import '../../controllers/brand/brand_controller.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BrandModel brand = Get.arguments as BrandModel;
    final controller = BrandController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.md,
          ),
          child: Column(
            children: [
              // * -- Brand card
              FeaturedBrandCard(
                brandTitle: brand.name,
                brandImage: brand.image,
                showBorder: true,
                productsCount: brand.productsCount,
              ),

              const SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),

              // * -- Brand Products
              FutureBuilder(
                // the data will come in the future and passed to snapshot
                // it updates the UI with the new data by its own no need for Obx
                future: controller.fetchProductsByBrandId(brand.id),

                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                        child: Text('Error in Fetching Products'));
                  }

                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Products Found'));
                  }

                  final products = snapshot.data!;

                  return SortableProducts(
                    products: products,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
