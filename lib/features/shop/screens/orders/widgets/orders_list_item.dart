import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/features/shop/models/order_model.dart';
import 'package:store/core/utils/constants/colors.dart';
import 'package:store/core/utils/constants/sizes.dart';
import 'package:store/core/utils/helper/helper_functions.dart';

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
      padding: const EdgeInsets.all(AppSizes.md),
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.dark
          : AppColors.lightGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              //* icon
              const Icon(Iconsax.ship),
              const SizedBox(
                width: AppSizes.spaceBetweenItems / 2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.orderStatusText,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: AppColors.primary,
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
            height: AppSizes.spaceBetweenItems,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    //* icon
                    const Icon(Iconsax.tag),
                    const SizedBox(
                      width: AppSizes.spaceBetweenItems / 2,
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
                      width: AppSizes.spaceBetweenItems / 2,
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
