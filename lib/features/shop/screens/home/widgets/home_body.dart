import 'package:flutter/material.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'home_banners_section.dart';
import 'popular_products_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      // *-- padding 16 pixels
      padding: EdgeInsets.symmetric(horizontal: AppSizes.sm),
      child: Column(
        children: [
          // * [1] -- banner section
          HomeBannerSection(),

          SizedBox(height: AppSizes.spaceBetweenSections),

          // * [2] -- popular products section
          PopularProductsSection(),

          SizedBox(height: AppSizes.spaceBetweenSections),
        ],
      ),
    );
  }
}
