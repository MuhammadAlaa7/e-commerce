import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/models/payment_method.dart';
import 'package:store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:store/core/utils/constants/image_strings.dart';
import 'package:store/core/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  Rx<PaymentMethod> selectedPaymentMethod =
      PaymentMethod(image: AppImages.paypal, name: 'Paypal').obs;

  // show the bottom sheet to select payment method
  Future<dynamic> selectPaymentMethod(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingSection(
                  title: 'Select Payment Method: ',
                  showActionButton: false,
                ),

                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),

                // * payment methods
                PaymentTile(
                    paymentMethod:
                        PaymentMethod(name: 'paypal', image: AppImages.paypal)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Google Pay', image: AppImages.googlePay)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Apple Pay', image: AppImages.applePay)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod:
                        PaymentMethod(name: 'VISA', image: AppImages.visa)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Master Card', image: AppImages.masterCard)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod:
                        PaymentMethod(name: 'Paytm', image: AppImages.paytm)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Paystack', image: AppImages.paystack)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Credit Card', image: AppImages.creditCard)),

                const SizedBox(
                  height: AppSizes.spaceBetweenItems / 2,
                ),

                const SizedBox(
                  height: AppSizes.spaceBetweenSections,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
