import 'package:flutter/material.dart';
import 'package:store/features/shop/controllers/cart/cart_item_controller.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/pricing_calculator.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartItemController.instance;
    final totalCartPrice = cartController.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // * subtotal text   >>> only the product price without shipping fee or tax
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$${totalCartPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        // * shipping fee text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$${PricingCalculator.getShippingCost('Egypt')}',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        // * tax fee text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text('\$${PricingCalculator.calculateTax(totalCartPrice, 'Egypt')}',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
        // * order total  text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
                '\$${PricingCalculator.calculateTotalPrice(totalCartPrice, 'Egypt')}',
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems / 2,
        ),
      ],
    );
  }
}
