import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/features/shop/models/order_model.dart';
import 'package:store/utils/constants22/colors.dart';
import 'package:store/utils/constants22/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      // borderColor: CHelperFunctions.isDarkMode(context)
      //     ? CColors.lightGrey
      //     : CColors.dark,
      padding: const EdgeInsets.all(CSizes.md),
      backgroundColor: CHelperFunctions.isDarkMode(context)
          ? CColors.dark
          : CColors.lightGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              //* icon
              const Icon(Iconsax.ship),
              const SizedBox(
                width: CSizes.spaceBetweenItems / 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.orderStatusText,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: CColors.primary,
                          fontWeightDelta: 2,
                        ),
                  ),
                  Text(order.formattedOrderDate,
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34))
            ],
          ),
          const SizedBox(
            height: CSizes.spaceBetweenItems,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    //* icon
                    const Icon(Iconsax.tag),
                    const SizedBox(
                      width: CSizes.spaceBetweenItems / 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Order',
                            style: Theme.of(context).textTheme.labelMedium),
                        Text(order.id,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    //* icon
                    const Icon(Iconsax.calendar),
                    const SizedBox(
                      width: CSizes.spaceBetweenItems / 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium),
                        Text(order.formattedDeliveryDate,
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
