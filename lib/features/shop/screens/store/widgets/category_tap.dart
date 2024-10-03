import 'package:flutter/material.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/features/shop/screens/store/widgets/category_shocases.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'all_cat_products.dart';

class CategoryTap extends StatelessWidget {
  const CategoryTap({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Column(
            children: [
              // * [1] -- category brands show cases for all brands in that category
              CategoryShowCases(
                category: category,
              ),
              const SizedBox(height: AppSizes.spaceBetweenSections),

              // * [2] -- all category Products
              AllCategoryProducts(category: category),
            ],
          ),
        ),
      ],
    );
  }
}
