import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/products/cart/coupon_code.dart';
import 'package:store/common/widgets/success_screen/success_screen.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/features/shop/controllers/product/order_controller.dart';
import 'package:store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';
import 'package:store/utils/helper/pricing_calculator.dart';
import 'package:store/utils/popups/loaders.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.md),
          child: Column(
            children: [
              // * cart items
              const CartItems(
                showAddRemoveButton: false,
              ),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),
              // * product coupon textfield
              const ProductCoupon(),
              const SizedBox(
                height: CSizes.spaceBetweenSections,
              ),
              // * billing section  -- the bill details

              RoundedContainer(
                showBorder: true,
                backgroundColor: CHelperFunctions.isDarkMode(context)
                    ? CColors.dark
                    : CColors.light,
                padding: const EdgeInsets.all(CSizes.md),
                child: const Column(
                  children: [
                    //* pricing
                    BillingAmountSection(),
                    // * divider
                    Divider(
                      color: Colors.grey,
                    ),

                    SizedBox(
                      height: CSizes.spaceBetweenItems,
                    ),
                    // * payment method
                    BillingPaymentSection(),
                    // * Address
                    SizedBox(
                      height: CSizes.spaceBetweenItems,
                    ),
                    BillingAddressSection(),
                  ],
                ),
              ),
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
                  CLoaders.warningSnackBar(
                      title: 'Empty Cart',
                      message: 'Add items in the cart to proceed to proceed.');
                },
        ),
      ),
    );
  }
}
