import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/utils/constants/sizes.dart';

import '../../controllers/product_controller.dart';
import 'widgets/wishlist_app_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WishlistAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.sm),
          child: CustomGridView(
            itemCount: 8,
            itemBuilder: (_, index) {
              return  VerticalProductCard(
                product: ProductController().featuredProducts[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
