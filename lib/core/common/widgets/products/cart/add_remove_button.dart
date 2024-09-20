import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/icons/circular_icon.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/models/cart_item_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          onPressed: () {
            cartController.removeOneItemFromCart(cartItem);
          },
          icon: Icons.remove,
          height: 32,
          width: 32,
          size: AppSizes.md,
          iconColor: isDark ? Colors.white : Colors.black,
        ),
        const SizedBox(width: AppSizes.sm),
        Text(cartItem.quantity.toString(),
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: AppSizes.sm),
        CircularIcon(
          onPressed: () {
            cartController.addOneItemToCart(cartItem);
          },
          icon: Icons.add,
          height: 32,
          width: 32,
          size: AppSizes.md,
          backgroundColor: AppColors.primary,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
