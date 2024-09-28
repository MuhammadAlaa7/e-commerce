import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/products/cart/cart_item.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showButtonsAndPrice = true,
  });
  final bool showButtonsAndPrice;
  
  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final cartItem = cartController.cartItems[index];

          return SingleCartItem(
            cartItem: cartItem,
            showButtonsAndPrice: showButtonsAndPrice,
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: AppSizes.md);
        },
        itemCount: cartController.cartItems.length,
      ),
    );
  }
}
