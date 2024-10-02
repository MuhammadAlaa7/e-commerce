import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/layouts/custom_grid_view.dart';

import 'package:store/core/common/widgets/loaders/animated_loader.dart';
import 'package:store/core/common/widgets/products/product_card/vertical_product_card.dart';

import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/shop/controllers/product/favorite_controller.dart';

import 'package:store/navigation_menu.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favController = FavoriteController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
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
                  return emptyWidget;
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

final emptyWidget = AnimationLoaderWidget(
  text: 'Oops! \n Your wishlist is empty',
  animationImage: AppImages.emptyAnimation,
);
