import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/brands/brand_show_case_card.dart';
import 'package:store/core/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:store/core/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:store/features/shop/controllers/brand/brand_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/core/routes/routes.dart';
import 'package:store/features/shop/screens/store/widgets/brand_show_case.dart';

import '../../../models/brand_model.dart';
import '../../../models/product_model.dart';

class CategoryShowCases extends StatelessWidget {
  const CategoryShowCases({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BrandModel>>(
      // * fetch all the brands show cases for that category
      future: BrandController.instance.fetchBrandsByCategoryId(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Column(
            children: [
              ListTileShimmer(),
              SizedBox(height: 10),
              BoxesShimmer(),
            ],
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Brands Found'));
        }
        // * the brands in the given category
        final categoryBrands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryBrands.length,
          itemBuilder: (context, index) {
            return BrandShowCase(brand: categoryBrands[index]);
          },
        );
      },
    );
  }
}
