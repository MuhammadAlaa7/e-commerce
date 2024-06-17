import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/helper/helper_functions.dart';

class OrdersListItem extends StatelessWidget {
  const OrdersListItem({
    super.key,
  });

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
                    'Processing',
                    style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: CColors.primary,
                          fontWeightDelta: 2,
                        ),
                  ),
                  Text('01 sep 2024',
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
                        Text('CWT001',
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
                        Text('05 oct 2024',
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
