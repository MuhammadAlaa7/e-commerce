import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/custom_grid_view.dart';
import 'package:store/common/widgets/products/product_card/vertical_product_card.dart';
import 'package:store/features/shop/controllers/product/favorite_controller.dart';
import 'package:store/utils/constants/sizes.dart';

import 'widgets/wishlist_app_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favController = FavoriteController.instance;
    return Scaffold(
      appBar: const WishlistAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.sm),
          child: Obx(
            () => FutureBuilder(
              future: favController.fetchFavoriteProducts(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return const Center(child: Text('No Products Found'));
                }
                final products = snapshot.data!;
                return CustomGridView(
                  itemCount: products.length,
                  itemBuilder: (_, index) => VerticalProductCard(
                    product: products[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
