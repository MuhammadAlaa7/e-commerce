import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/models/payment_method.dart';
import 'package:store/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  Rx<PaymentMethod> selectedPaymentMethod =
      PaymentMethod(image: CImages.paypal, name: 'Paypal').obs;

  // show the bottom sheet to select payment method
  Future<dynamic> selectPaymentMethod(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(CSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadingSection(
                  title: 'Select Payment Method: ',
                  showActionButton: false,
                ),

                const SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),

                // * payment methods
                PaymentTile(
                    paymentMethod:
                        PaymentMethod(name: 'paypal', image: CImages.paypal)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Google Pay', image: CImages.googlePay)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Apple Pay', image: CImages.applePay)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod:
                        PaymentMethod(name: 'VISA', image: CImages.visa)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Master Card', image: CImages.masterCard)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod:
                        PaymentMethod(name: 'Paytm', image: CImages.paytm)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Paystack', image: CImages.paystack)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),
                PaymentTile(
                    paymentMethod: PaymentMethod(
                        name: 'Credit Card', image: CImages.creditCard)),

                const SizedBox(
                  height: CSizes.spaceBetweenItems / 2,
                ),

                const SizedBox(
                  height: CSizes.spaceBetweenSections,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
