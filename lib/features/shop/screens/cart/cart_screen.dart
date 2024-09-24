import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/loaders/animated_loader.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/screens/checkout/checkout_screen.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/core/utils/constants/image_strings.dart';

import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(() {
        final emptyWidget = AnimationLoaderWidget(
          text: 'Opps ! Your cart is empty',
          animationImage: AppImages.cartAnimation,
          showAction: true,
          actionText: 'let\'s fill it',
          onActionPressed: () {
            Get.off(() => const HomeMenu());
          },
        );
        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        }
        return const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.md),
            child: CartItems(),
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const SizedBox();
        }
        return DefaultButton(
          label:
              'Checkout   \$ ${cartController.totalCartPrice.toStringAsFixed(2)}',
          onPressed: () {
            Get.to(() => const CheckoutScreen());
          },
        );
      }),
    );
  }
}
