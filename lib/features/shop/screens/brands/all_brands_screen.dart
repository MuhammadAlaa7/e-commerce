import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/brands/featured_brands_item.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomGridView(
                mainAxisExtent: 80,
                mainAxisSpacing: CSizes.gridViewSpacing,
                itemCount: 10,
                itemBuilder: (_, index) => FeaturedBrandCard(
                  onTap: () {
                    CHelperFunctions.goTo(context, const BrandProductsScreen());
                  },
                  showBorder: true,
                  brandTitle: 'Nike',
                  brandImage: CImages.animalIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
