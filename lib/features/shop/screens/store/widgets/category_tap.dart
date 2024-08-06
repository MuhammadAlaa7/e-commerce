import 'package:flutter/material.dart';
import 'package:store/common/widgets/brands/brand_show_case.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class CategoryTap extends StatelessWidget {
  const CategoryTap({
    super.key,
    required this.categoryTap,
  });
final CategoryModel categoryTap ; 
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CSizes.sm),
          child: Column(
            children: [
              // * Brands
              const BrandShowCase(
                images: [
                  CImages.productImage64,
                  CImages.productImage20,
                  CImages.productImage26,
                ],
              ),
              const SizedBox(height: CSizes.spaceBetweenSections),
              // * Products
              HeadingSection(
                title: 'You might like ',
                onPressed: () {},
              ),

              const SizedBox(height: CSizes.spaceBetweenSections),
              CustomGridView(
                itemCount: 6,
                itemBuilder: (_, index) {
                  return const VerticalProductCard();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
