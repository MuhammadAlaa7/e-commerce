import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/products/cart/cart_counter_icon.dart';

PreferredSizeWidget storeAppBar(BuildContext context) {
  return CustomAppBar(
    title: Text(
      'Store',
      style: Theme.of(context).textTheme.headlineMedium,
    ),
    actions: const [
      CounterIcon(
        icon: Iconsax.shopping_bag,
      ),
    ],
  );
}
