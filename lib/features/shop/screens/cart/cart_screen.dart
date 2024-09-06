import 'package:flutter/material.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/features/shop/screens/checkout/checkout_screen.dart';

import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

import 'widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      bottomNavigationBar: DefaultButton(
        
        label: 'Checkout\t\t \$3805.0',
        onPressed: () {
          CHelperFunctions.navigateToScreen(context, const CheckoutScreen());
        },
      ),
      body: const Padding(
        padding: EdgeInsets.all(CSizes.md),
        child: CartItems(),
      ),
    );
  }
}
