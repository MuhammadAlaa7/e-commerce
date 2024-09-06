import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/buttons/default_button.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/products/cart/coupon_code.dart';
import 'package:store/common/widgets/success_screen/success_screen.dart';
import 'package:store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:store/navigation_menu.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: DefaultButton(
        label: 'Checkout\t\t \$3805.0',
        onPressed: () {
          CHelperFunctions.navigateToScreen(
            context,
            SuccessScreen(
              title: 'Payment Success !',
              subTitle: 'Your item will be shipped soon !',
              image: CImages.paymentSuccessfulAnimation,
              onPressed: () {
              Get.offAll( const NavigationMenu());
              },
              //  buttonLabel: '',
            ),
          );
        },
      ),
    );
  }
}
