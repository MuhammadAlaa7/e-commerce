import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/app_bar/custom_app_bar.dart';
import 'package:store/core/common/widgets/shimmers/shimmer_effect.dart';
import 'package:store/core/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:store/features/personalization/controllers/user_controller.dart';
import 'package:store/core/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: Colors.grey[400],
                ),
          ),
          Obx(() {
            if (controller.profileLoading.value == true) {
              return CustomShimmerEffect(
                width: MediaQuery.of(context).size.width - 40,
                height: 40,
              );
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: Colors.white,
                    ),
              );
            }
          }),
        ],
      ),
      actions: [
        CounterIcon(
            icon: Iconsax.shopping_bag,
            color: Colors.white,
            onPressed: () {
              Get.toNamed('/cart');
            }),
      ],
    );
  }
}
