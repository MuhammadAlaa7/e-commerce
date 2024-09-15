import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/products/cart/add_remove_button.dart';
import 'package:store/common/widgets/products/cart/cart_item.dart';
import 'package:store/common/widgets/texts/product_price_text.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final cartItem = cartController.cartItems[index];

          return CartItem(
            cartItem: cartItem,
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(height: CSizes.md);
        },
        itemCount: cartController.cartItems.length,
      ),
    );
  }
}



/* 

 if (showAddRemoveButton)
                const SizedBox(height: CSizes.spaceBetweenItems),
      
              // * add and remove button and price
              if (showAddRemoveButton)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 70,
                        ),
                        ProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                    ProductPriceText(
                      price: '123',
                      isLarge: false,
                    ),
                  ],
                ),


 */