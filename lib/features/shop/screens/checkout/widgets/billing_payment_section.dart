import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/texts/section_heading.dart';
import 'package:store/features/shop/controllers/product/checkout_controller.dart';
import 'package:store/features/shop/models/payment_method.dart';
import 'package:store/utils/constants22/sizes.dart';

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
          height: CSizes.spaceBetweenItems / 2,
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

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
    required this.paymentMethod,
  });
  final PaymentMethod paymentMethod;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedContainer(
          width: 60,
          height: 35,
          padding: const EdgeInsets.all(CSizes.sm),
          backgroundColor: Colors.transparent,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              paymentMethod.image,
            ),
          ),
        ),
        const SizedBox(
          width: CSizes.spaceBetweenItems / 2,
        ),
        Text(
          paymentMethod.name,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
