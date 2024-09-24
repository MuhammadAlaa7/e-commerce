import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/features/shop/controllers/product/favorite_controller.dart';

import '../../icons/circular_icon.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({
    super.key,
    required this.productId,
    required this.height,
    required this.width,
    required this.iconSize , 
  });
  final String productId;
  final double height, width , iconSize;
  @override
  Widget build(BuildContext context) {
    // dependency injection approach
    final favController = FavoriteController.instance;

    return Obx(
      () => CircularIcon(
        height: height,
        width: width,
        size: iconSize,
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
