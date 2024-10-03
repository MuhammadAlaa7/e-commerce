import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/product/product_checkout_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';

import 'payment_widget.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = CheckoutController.instance;
    return Column(
      children: [
        // * heading
        HeadingSection(
          buttonTitle: 'Change',
          title: 'Payment Method',
          onPressed: () {
            checkoutController.selectPaymentMethod(context);
          },
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        Obx(
          () => PaymentWidget(
            paymentMethod: checkoutController.selectedPaymentMethod.value,
          ),
        ),
      ],
    );
  }
}

