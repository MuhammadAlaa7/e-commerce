import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:store/features/shop/screens/cart/cart_screen.dart';
import 'package:store/utils/constants/text_strings.dart';
import 'package:store/utils/helper/helper_functions.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CTexts.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: Colors.grey[400],
                ),
          ),
          Text(
            CTexts.homeAppBarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: Colors.white,
                ),
          ),
        ],
      ),
      actions: [
        CounterIcon(
          onPressed: () {
            CHelperFunctions.goTo(context, const CartScreen());
          },
          icon: Iconsax.shopping_bag,
          color: Colors.white,
        ),
      ],
    );
  }
}
