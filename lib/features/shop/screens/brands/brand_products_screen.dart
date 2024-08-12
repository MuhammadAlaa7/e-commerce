import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/brands/featured_brands_item.dart';
import 'package:store/common/widgets/products/sortable_products/sortable_products.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            CSizes.md,
          ),
          child: Column(
            children: [
              // * -- Brand card
              FeaturedBrandCard(
                brandTitle: 'Nike',
                brandImage: CImages.clothIcon,
                showBorder: true,
              ),

              SizedBox(
                height: CSizes.spaceBetweenSections,
              ),

              // * -- Brand Products
            //  SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
