import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/icons/circular_icon.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/models/product_model.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class BottomNavAddToCart extends StatelessWidget {
  const BottomNavAddToCart({
    super.key,
    required this.product,
  });


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartItemController.instance;
    //! this will automatically update the already added product count
    controller.updateAlreadyAddedProductCount(product);
    final isDark = CHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CSizes.defaultSpace, vertical: CSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDark ? CColors.lightDark : CColors.light,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(CSizes.cardRadiusLg),
            topRight: Radius.circular(CSizes.cardRadiusLg)),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularIcon(
                  icon: Iconsax.minus,
                  onPressed: () {
                    // check first if it is greater than 1
                    if (controller.productQuantityInCart.value < 1) {
                      null;
                    } else {
                      controller.productQuantityInCart.value--;
                    }
                  },
                  width: 40,
                  height: 40,
                  backgroundColor: Colors.black,
                  iconColor: Colors.white,
                ),
                const SizedBox(width: CSizes.spaceBetweenItems),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(width: CSizes.spaceBetweenItems),
                CircularIcon(
                  icon: Iconsax.add,
                  onPressed: () {
                    controller.productQuantityInCart.value++;
                  },
                  width: 40,
                  height: 40,
                  backgroundColor: Colors.black,
                  iconColor: Colors.white,
                ),
              ],
            ),
            // * this spacer is used to align the button to the right through pushing it
            const Spacer(flex: 1),
            // * the button must be expanded because it is  in a row
            Expanded(
              flex: 2,
              child: DefaultButton(
                label: 'Add To Cart',
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () {
                        controller.addToCart(product);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(
                    CSizes.md,
                  ),
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
