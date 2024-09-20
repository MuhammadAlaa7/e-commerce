import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/shop/controllers/product/favorite_controller.dart';

import '../../icons/circular_icon.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    // dependency injection approach
    final favController = Get.put(FavoriteController());

    return Obx(
      () => CircularIcon(
        icon: favController.isFavorite(productId)
            ? Iconsax.heart5
            : Iconsax.heart,
        iconColor:
            favController.isFavorite(productId) ? Colors.red : Colors.black,
        onPressed: () => favController.toggleFavorite(productId),
      ),
    );
  }
}
