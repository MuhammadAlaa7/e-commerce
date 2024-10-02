
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/brands/brand_show_case_card.dart';
import 'package:store/core/common/widgets/shimmers/boxes_shimmer.dart';
import 'package:store/core/common/widgets/shimmers/list_tile_shimmer.dart';
import 'package:store/features/shop/controllers/brand/brand_controller.dart';
import 'package:store/features/shop/models/brand_model.dart';
import 'package:store/features/shop/models/category_model.dart';
import 'package:store/core/routes/routes.dart';
import 'package:store/features/shop/models/product_model.dart';


class BrandShowCase extends StatelessWidget {
  const BrandShowCase({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      // * for each brand  show case card fetch the show case content [ brand and its products ]
      future: BrandController.instance.fetchProductsByBrandId(brand.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _Loader();
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Products Found'));
        }

        final brandProducts = snapshot.data!;
        return BrandShowCaseCard(
          brand: brand,
          images: brandProducts
              .map((product) => product.thumbnail)
              .take(3)
              .toList(),
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
