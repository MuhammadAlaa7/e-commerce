import 'package:flutter/material.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/features/shop/models/payment_method.dart';

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
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: Colors.transparent,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              paymentMethod.image,
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.spaceBetweenItems / 2,
        ),
        Text(
          paymentMethod.name,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
