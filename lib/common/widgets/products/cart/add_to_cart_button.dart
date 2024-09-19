import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/enums.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final height = CHelperFunctions.screenHeight();
    final width = CHelperFunctions.screenWidth();
    final cartController = CartItemController.instance;
    return InkWell(
      onTap: () {
        // if the product has variations , navigate to the product details screen
        // else , add the product to the cart screen
        if (product.productType == ProductType.single.name) {
          final cartItem = cartController.convertProductToCartItem(product, 1);
          cartController.addOneItemToCart(cartItem);
        } else {
          // it is a variable product , so navigate to the product details screen
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product);

        return Container(
          padding: const EdgeInsets.all(CSizes.sm),
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? CColors.primary : CColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(CSizes.cardRadiusMd),
              bottomRight: Radius.circular(CSizes.cardRadiusMd),
            ),
          ),
          child: SizedBox(
            height: height * 0.03,
            width: width * 0.06,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: Colors.white),
                    )
                  : const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
