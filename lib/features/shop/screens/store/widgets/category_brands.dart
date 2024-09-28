import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/brands/brand_show_case.dart';
import 'package:store/core/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:store/core/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:store/features/shop/controllers/brand/brand_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/core/routes/routes.dart';

import '../../../models/brand_model.dart';
import '../../../models/product_model.dart';

class CategoryBrandsSection extends StatelessWidget {
  const CategoryBrandsSection({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BrandModel>>(
      // * fetch all the brands show cases for that category
      future: BrandController.instance.fetchBrandsByCategory(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _Loader();
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Brands Found'));
        }

        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            return BrandProductsCard(brand: brands[index]);
          },
        );
      },
    );
  }
}

class BrandProductsCard extends StatelessWidget {
  const BrandProductsCard({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      // * for each brand  show case card fetch the show case content [ brand and its products ]
      future: BrandController.instance.fetchBrandProducts(brand.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _Loader();
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Products Found'));
        }

        final products = snapshot.data!;
        return InkWell(
          onTap: () => Get.toNamed(Routes.brandProducts, arguments: brand),
          child: BrandShowCaseCard(
            brand: brand,
            images:
                products.map((product) => product.thumbnail).take(3).toList(),
          ),
        );
      },
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTileShimmer(),
        SizedBox(height: 10),
        BoxesShimmer(),
      ],
    );
  }
}
