import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({
    super.key,
    this.color,
    required this.icon,
    required this.onPressed,
  });
  final Color? color;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // final cartController = Get.put(CartItemController());
    final cartController = CartItemController.instance;
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed ,
          icon: Icon(
            icon,
            color: color ?? (isDark ? Colors.white : Colors.black),
          ),
        ),
        Positioned(
          right: 2,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: isDark ? Colors.white : Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Obx(
                () => Text(
                  cartController.numberOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.apply(
                        color: isDark ? Colors.black : Colors.white,
                        fontSizeFactor: 0.8,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
