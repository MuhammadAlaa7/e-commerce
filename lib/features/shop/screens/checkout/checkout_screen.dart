import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/buttons/default_button.dart';
import 'package:store/core/common/widgets/products/cart/coupon_code.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/controllers/product/product_order_controller.dart';
import 'package:store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/pricing_calculator.dart';
import 'package:store/core/utils/popups/toasts.dart';

import 'widgets/bill_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final totalAmount = CartItemController.instance.totalCartPrice.value;
    
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.md),
          child: Column(
            children: [
              // * cart items
              // current cart items from the controller 
              CartItems(showButtonsAndPrice: false,),
              SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              // * product coupon textfield
              ProductCoupon(),
              SizedBox(
                height: AppSizes.spaceBetweenSections,
              ),
              // * billing section  -- the bill details

              BillSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DefaultButton(
          label:
              'Checkout\t\t \$${PricingCalculator.calculateTotalPrice(totalAmount, 'Egypt')}',
          onPressed: totalAmount > 0
              ? () => OrderController.instance.processOrder(totalAmount)
              : () {
                  AppToasts.warningSnackBar(
                      title: 'Empty Cart',
                      message: 'Add items in the cart to proceed to proceed.');
                },
        ),
      ),
    );
  }
}
