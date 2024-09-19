import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/brands/brand_show_case.dart';
import 'package:store/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:store/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:store/features/shop/controllers/brand/brand_controller.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/routes/routes.dart';

class CategoryBrandsSection extends StatelessWidget {
  const CategoryBrandsSection({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    //  final allProductController = AllProductsController.instance;

    // ! the first future builder will return brands
    // * the list view will be built in the future
    return FutureBuilder(
      future: controller.fetchBrandsByCategory(category.id),
      builder: (_, brandsSnapshot) {
// loader

        const loader = Column(
          children: [
            ListTileShimmer(),
            SizedBox(
              height: 10,
            ),
            BoxesShimmer(),
          ],
        );

        if (brandsSnapshot.connectionState == ConnectionState.waiting) {
          return loader;
        }

        if (brandsSnapshot.hasError ||
            brandsSnapshot.data == null ||
            brandsSnapshot.data!.isEmpty) {
          return const Center(
            child: Text('No Brands Found'),
          );
        }

        //* if it has data display it
        final brands = brandsSnapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              //  ! the second future builder will return products for the specific brand
              // we use second future builder because the products for the specific brand will be fetched in the future
              return FutureBuilder(
                  future: controller.fetchBrandProducts(brands[index].id),
                  builder: (_, productsSnapshot) {
                    if (productsSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return loader;
                    }

                    if (productsSnapshot.hasError ||
                        productsSnapshot.data == null ||
                        productsSnapshot.data!.isEmpty) {
                      return const Center(child: Text('No Products Found'));
                    }

                    final products = productsSnapshot.data!;
                    return InkWell(
                      onTap: () => Get.toNamed(Routes.brandProducts,
                          arguments: brands[index]),
                      child: BrandShowCaseCard(
                        brand: brands[index],
                        images: products
                            .map((product) => product.thumbnail)
                            .take(3)
                            .toList(),
                      ),
                    );
                  });
            });
      },
    );
  }
}
