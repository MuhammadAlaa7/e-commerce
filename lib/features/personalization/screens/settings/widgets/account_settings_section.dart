import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store/core/common/widgets/texts/section_heading.dart';
import 'package:store/core/routes/app_routes.dart';
import 'package:store/features/personalization/screens/address/adress_screen.dart';
import 'package:store/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:store/features/shop/screens/cart/cart_screen.dart';
import 'package:store/features/shop/screens/orders/orders_screen.dart';
import 'package:store/core/utils/constants/sizes.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeadingSection(
          title: 'Account Settings',
          showActionButton: false,
        ),
        const SizedBox(
          height: AppSizes.spaceBetweenItems,
        ),
        SettingsMenuTile(
          icon: Iconsax.safe_home,
          title: 'My Addresses',
          subTitle: 'Set shopping delivery address',
          onTap: () {
            Get.toNamed(AppRoutes.address);
          },
        ),
        SettingsMenuTile(
          icon: Iconsax.shopping_cart,
          title: 'My Cart',
          subTitle: 'Add, or remove products and move to checkout',
          onTap: () {
          Get.toNamed(AppRoutes.cart);
          },
        ),
        SettingsMenuTile(
          icon: Iconsax.bag_tick,
          title: 'My Orders',
          subTitle: 'In-progress, completed, and canceled orders',
          onTap: () {
            Get.toNamed(AppRoutes.order);
          },
        ),
      ],
    );
  }
}
