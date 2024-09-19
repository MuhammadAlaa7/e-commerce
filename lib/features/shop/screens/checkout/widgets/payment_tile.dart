import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/common/widgets/images/rounded_image.dart';
import 'package:store/features/shop/controllers/product/checkout_controller.dart';
import 'package:store/features/shop/models/payment_method.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

///This list tile only to be shown in the bottom sheet when changing the payment method
class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
    required this.paymentMethod,
  });
  final PaymentMethod paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: RoundedContainer(
          padding: const EdgeInsets.all(CSizes.sm),
          height: 40,
          width: 60,
          backgroundColor: CHelperFunctions.isDarkMode(context)
              ? CColors.light
              : Colors.white,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              paymentMethod.image,
            ),
          )),
      title: Text(
        paymentMethod.name,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(
        Iconsax.arrow_right_34,
      ),
    );
  }
}
