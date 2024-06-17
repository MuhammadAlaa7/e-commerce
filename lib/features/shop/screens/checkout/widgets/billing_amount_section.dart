import 'package:flutter/material.dart';
import 'package:store/utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // * subtotal text
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$1030.00', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        // * shipping fee text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$6.00', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        // * tax fee text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$6.00', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
        // * order total  text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$106.00', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBetweenItems / 2,
        ),
      ],
    );
  }
}
